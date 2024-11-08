import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/pick_ban_state.dart';
import '../../../core/models/champion.dart';

class PickBanNotifier extends AsyncNotifier<PickBanState> {
  @override
  Future<PickBanState> build() async {
    return PickBanState(
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
        return _handleFirstBanPhase(champion, currentState);
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
    if (currentState.isBlueTeamTurn) {
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
      
      return currentState.copyWith(
        bluePicks: newBluePicks,
        isBlueTeamTurn: false,
        currentPhase: shouldSwitchPhase ? PickBanPhase.secondBanPhase : PickBanPhase.firstPickPhase,
      );
    } else {
      final newRedPicks = [...currentState.redPicks, champion];
      final shouldSwitchPhase = currentState.bluePicks.length == 3 && newRedPicks.length == 3;
      
      return currentState.copyWith(
        redPicks: newRedPicks,
        isBlueTeamTurn: true,
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
      
      return currentState.copyWith(
        bluePicks: newBluePicks,
        isBlueTeamTurn: false,
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
    state = AsyncData(PickBanState(
      blueBans: [],
      redBans: [],
      bluePicks: [],
      redPicks: [],
      isBlueTeamTurn: true,
      currentPhase: PickBanPhase.firstBanPhase,
    ));
  }
}

final pickBanProvider = AsyncNotifierProvider<PickBanNotifier, PickBanState>(
  () => PickBanNotifier(),
); 