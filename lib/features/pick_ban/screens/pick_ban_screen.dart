import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/champion.dart';
import '../../../core/models/pick_ban_state.dart';
import '../providers/pick_ban_provider.dart';
import '../../../core/services/champion_service.dart';
import '../providers/search_provider.dart';
import '../widgets/champion_grid.dart';
import '../widgets/team_panel.dart';
import '../../../core/constants/colors.dart';
import '../widgets/search_bar.dart';
import '../widgets/game_drawer.dart';

class PickBanScreen extends ConsumerWidget {
  const PickBanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickBanState = ref.watch(pickBanProvider);
    final searchQuery = ref.watch(searchProvider);
    int length = ChampionService.championLength;

    print(length);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'LOL BANPICK',
          style: TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.gold),
        elevation: 0,
      ),
      drawer: const GameDrawer(),
      body: SafeArea(
        child: pickBanState.when(
          data: (state) => SingleChildScrollView(
            child: Column(
              children: [
               // _buildHeader(context, state),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildTeam(
                        context,
                        'BLUE TEAM',
                        AppColors.primaryBlue,
                        state.blueBans,
                        state.bluePicks,
                        state.isBlueTeamTurn,
                      ),
                      const Divider(
                        color: AppColors.gold,
                        thickness: 0.5,
                        height: 32,
                      ),
                      _buildTeam(
                        context,
                        'RED TEAM',
                        AppColors.primaryRed,
                        state.redBans,
                        state.redPicks,
                        !state.isBlueTeamTurn,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildPhaseIndicator(context, state),
                Visibility(
                  visible: state.currentPhase != PickBanPhase.completed,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ChampionSearchBar(),
                  ),
                ),
                Visibility(
                  visible: state.currentPhase != PickBanPhase.completed,
                  child: SizedBox(
                    height: 400,
                    child: _buildChampionGrid(ref, state, searchQuery),
                  ),
                ),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.gold),
          ),
          error: (error, stack) => Center(
            child: SelectableText.rich(
              TextSpan(
                text: '오류가 발생했습니다: $error',
                style: const TextStyle(color: AppColors.primaryRed),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeam(
    BuildContext context,
    String teamName,
    Color teamColor,
    List<Champion> bans,
    List<Champion> picks,
    bool isActive,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: isActive ? teamColor : teamColor.withOpacity(0.3),
          width: isActive ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teamName,
            style: TextStyle(
              color: teamColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BANS:',
                style: TextStyle(
                  color: teamColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - (4 * 8)) / 5;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      if (index < bans.length) {
                        return _ChampionIcon(
                          champion: bans[index],
                          size: itemWidth,
                        );
                      }
                      return _EmptySlot(
                        size: itemWidth,
                        borderColor: teamColor.withOpacity(0.3),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PICKS:',
                style: TextStyle(
                  color: teamColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - (4 * 8)) / 5;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      if (index < picks.length) {
                        return _ChampionIcon(
                          champion: picks[index],
                          size: itemWidth,
                        );
                      }
                      return _EmptySlot(
                        size: itemWidth,
                        borderColor: teamColor.withOpacity(0.3),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, PickBanState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'League of Legends',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseIndicator(BuildContext context, PickBanState state) {
    final phaseText = _getPhaseText(state.currentPhase);
    final turnText = state.isBlueTeamTurn ? 'Blue Team Turn' : 'Red Team Turn';

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            phaseText,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.gold,
                ),
          ),
          const SizedBox(height: 8),
          Visibility(
            visible: state.currentPhase != PickBanPhase.completed,
            child: Text(
              turnText,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: state.isBlueTeamTurn
                        ? AppColors.primaryBlue
                        : AppColors.primaryRed,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          // 다시 시작
          Visibility(
            visible: state.currentPhase == PickBanPhase.completed,
            child: Consumer(builder: (context, ref, child) {
              return InkWell(
                onTap: () => ref.read(pickBanProvider.notifier).resetGame(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh_rounded,
                      color: AppColors.gold,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '게임 리셋',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildChampionGrid(
      WidgetRef ref, PickBanState state, String searchQuery) {
    final allAvailableChampions = ChampionService.getAvailableChampions(
      bannedChampions: [...state.blueBans, ...state.redBans],
      pickedChampions: [...state.bluePicks, ...state.redPicks],
    );

    final filteredChampions = searchQuery.isEmpty
        ? allAvailableChampions
        : ChampionService.searchChampions(searchQuery)
            .where((c) => allAvailableChampions.contains(c))
            .toList();

    return ChampionGrid(
      champions: filteredChampions,
      onChampionSelected: (champion) {
        ref.read(pickBanProvider.notifier).selectChampion(champion);
      },
    );
  }

  String _getPhaseText(PickBanPhase phase) {
    switch (phase) {
      case PickBanPhase.firstBanPhase:
        return '첫 번째 밴 단계';
      case PickBanPhase.firstPickPhase:
        return '첫 번째 픽 단계';
      case PickBanPhase.secondBanPhase:
        return '두 번째 밴 단계';
      case PickBanPhase.secondPickPhase:
        return '두 번째 픽 단계';
      case PickBanPhase.completed:
        return '밴픽 완료';
    }
  }
}

class _ChampionIcon extends StatelessWidget {
  final Champion champion;
  final double size;

  const _ChampionIcon({
    required this.champion,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Image.network(
          champion.championImageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                color: AppColors.gold,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(Icons.error, color: AppColors.primaryRed),
          ),
        ),
      ),
    );
  }
}

class _EmptySlot extends StatelessWidget {
  final double size;
  final Color borderColor;

  const _EmptySlot({
    required this.size,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
    );
  }
}
