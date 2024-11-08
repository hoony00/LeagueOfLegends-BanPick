import 'champion.dart';

class PickBanState {
  final List<Champion> blueBans;
  final List<Champion> redBans;
  final List<Champion> bluePicks;
  final List<Champion> redPicks;
  final bool isBlueTeamTurn;
  final PickBanPhase currentPhase;

  const PickBanState({
    required this.blueBans,
    required this.redBans,
    required this.bluePicks,
    required this.redPicks,
    required this.isBlueTeamTurn,
    required this.currentPhase,
  });

  PickBanState copyWith({
    List<Champion>? blueBans,
    List<Champion>? redBans,
    List<Champion>? bluePicks,
    List<Champion>? redPicks,
    bool? isBlueTeamTurn,
    PickBanPhase? currentPhase,
  }) {
    return PickBanState(
      blueBans: blueBans ?? this.blueBans,
      redBans: redBans ?? this.redBans,
      bluePicks: bluePicks ?? this.bluePicks,
      redPicks: redPicks ?? this.redPicks,
      isBlueTeamTurn: isBlueTeamTurn ?? this.isBlueTeamTurn,
      currentPhase: currentPhase ?? this.currentPhase,
    );
  }
}

enum PickBanPhase {
  firstBanPhase,
  firstPickPhase,
  secondBanPhase,
  secondPickPhase,
  completed
} 