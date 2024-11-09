import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/pick_ban_state.dart';
import '../../../core/models/champion.dart';


final pickBanProvider = AsyncNotifierProvider<PickBanNotifier, PickBanState>(
      () => PickBanNotifier(),
);

class PickBanNotifier extends AsyncNotifier<PickBanState> {
  @override
  Future<PickBanState> build() async {
    return const PickBanState(
      blueBans: [],
      redBans: [],
      bluePicks: [],
      redPicks: [],
      isBlueTeamTurn: true,
      currentPhase: PickBanPhase.firstBanPhase,
    );
  }

  Future<void> selectChampion(Champion champion) async {
    final currentState = state.value!;
    
    if (currentState.currentPhase == PickBanPhase.completed) {
      throw Exception('Draft is already completed');
    }

    state = AsyncData(_processSelection(champion, currentState));
  }

  PickBanState _processSelection(Champion champion, PickBanState currentState) {
    switch (currentState.currentPhase) {
      case PickBanPhase.firstBanPhase:
        /// 맨 처음 양팀 밴픽 3개씩
        return _handleFirstBanPhase(champion, currentState);
        /// 블루 1, 레드2, 블루 2, 레드 1 순으로 픽
      case PickBanPhase.firstPickPhase:
        return _handleFirstPickPhase(champion, currentState);
      case PickBanPhase.secondBanPhase:
        return _handleSecondBanPhase(champion, currentState);
      case PickBanPhase.secondPickPhase:
        return _handleSecondPickPhase(champion, currentState);
      case PickBanPhase.completed:
        throw Exception('Draft is already completed');
    }
  }

  PickBanState _handleFirstBanPhase(Champion champion, PickBanState currentState) {
    /// 맨 처음 양팀 밴픽 3개씩
    if (currentState.isBlueTeamTurn) {
      // 밴 추가
      final newBlueBans = [...currentState.blueBans, champion];
      final shouldSwitchPhase = newBlueBans.length == 3 && currentState.redBans.length == 3;
      
      return currentState.copyWith(
        blueBans: newBlueBans,
        isBlueTeamTurn: false,
        currentPhase: shouldSwitchPhase ? PickBanPhase.firstPickPhase : PickBanPhase.firstBanPhase,
      );
    } else {
      final newRedBans = [...currentState.redBans, champion];
      final shouldSwitchPhase = currentState.blueBans.length == 3 && newRedBans.length == 3;
      
      return currentState.copyWith(
        redBans: newRedBans,
        isBlueTeamTurn: true,
        currentPhase: shouldSwitchPhase ? PickBanPhase.firstPickPhase : PickBanPhase.firstBanPhase,
      );
    }
  }

  PickBanState _handleFirstPickPhase(Champion champion, PickBanState currentState) {
    if (currentState.isBlueTeamTurn) {
      final newBluePicks = [...currentState.bluePicks, champion];
      final shouldSwitchPhase = newBluePicks.length == 3 && currentState.redPicks.length == 3;

      bool isChangeTurn = true;
      // 첫 블루 픽의 경우
      final bool isFirstPick = newBluePicks.length == 1 || newBluePicks.length == 3;

      if(isFirstPick) {
        isChangeTurn = false;
      }

      return currentState.copyWith(
        bluePicks: newBluePicks,
        isBlueTeamTurn: isChangeTurn,
        currentPhase: shouldSwitchPhase ? PickBanPhase.secondBanPhase : PickBanPhase.firstPickPhase,
      );
    } else {
      final newRedPicks = [...currentState.redPicks, champion];
      final shouldSwitchPhase = currentState.bluePicks.length == 3 && newRedPicks.length == 3;

      final bool isChangeTurn = newRedPicks.length == 2 && currentState.bluePicks.length == 1;

      return currentState.copyWith(
        redPicks: newRedPicks,
        isBlueTeamTurn: isChangeTurn,
        currentPhase: shouldSwitchPhase ? PickBanPhase.secondBanPhase : PickBanPhase.firstPickPhase,
      );
    }
  }

  PickBanState _handleSecondBanPhase(Champion champion, PickBanState currentState) {
    if (currentState.isBlueTeamTurn) {
      final newBlueBans = [...currentState.blueBans, champion];
      final shouldSwitchPhase = newBlueBans.length == 5 && currentState.redBans.length == 5;
      
      return currentState.copyWith(
        blueBans: newBlueBans,
        isBlueTeamTurn: false,
        currentPhase: shouldSwitchPhase ? PickBanPhase.secondPickPhase : PickBanPhase.secondBanPhase,
      );
    } else {
      final newRedBans = [...currentState.redBans, champion];
      final shouldSwitchPhase = currentState.blueBans.length == 5 && newRedBans.length == 5;
      
      return currentState.copyWith(
        redBans: newRedBans,
        isBlueTeamTurn: true,
        currentPhase: shouldSwitchPhase ? PickBanPhase.secondPickPhase : PickBanPhase.secondBanPhase,
      );
    }
  }

  PickBanState _handleSecondPickPhase(Champion champion, PickBanState currentState) {
    if (currentState.isBlueTeamTurn) {
      final newBluePicks = [...currentState.bluePicks, champion];
      final shouldComplete = newBluePicks.length == 5 && currentState.redPicks.length == 5;

      final bool isChangeTurn = newBluePicks.length == 4;

      return currentState.copyWith(
        bluePicks: newBluePicks,
        isBlueTeamTurn: isChangeTurn,
        currentPhase: shouldComplete ? PickBanPhase.completed : PickBanPhase.secondPickPhase,
      );
    } else {
      final newRedPicks = [...currentState.redPicks, champion];
      final shouldComplete = currentState.bluePicks.length == 5 && newRedPicks.length == 5;
      
      return currentState.copyWith(
        redPicks: newRedPicks,
        isBlueTeamTurn: true,
        currentPhase: shouldComplete ? PickBanPhase.completed : PickBanPhase.secondPickPhase,
      );
    }
  }

  Future<void> resetGame() async {
    state = const AsyncData(PickBanState(
      blueBans: [],
      redBans: [],
      bluePicks: [],
      redPicks: [],
      isBlueTeamTurn: true,
      currentPhase: PickBanPhase.firstBanPhase,
    ));
  }
}
