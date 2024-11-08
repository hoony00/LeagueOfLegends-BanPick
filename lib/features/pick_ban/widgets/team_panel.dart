import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/models/champion.dart';

class TeamPanel extends StatelessWidget {
  final String teamName;
  final Color teamColor;
  final List<Champion> bans;
  final List<Champion> picks;
  final bool isActive;

  const TeamPanel({
    super.key,
    required this.teamName,
    required this.teamColor,
    required this.bans,
    required this.picks,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const SizedBox(height: 16),
          _buildSection('BANS', bans),
          const SizedBox(height: 16),
          _buildSection('PICKS', picks),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Champion> champions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: teamColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: title == 'BANS' ? 5 : 5, // 총 슬롯 수
            itemBuilder: (context, index) {
              if (index < champions.length) {
                return _ChampionIcon(
                  champion: champions[index],
                  margin: const EdgeInsets.only(right: 8),
                );
              } else {
                return _EmptySlot(
                  margin: const EdgeInsets.only(right: 8),
                  borderColor: teamColor.withOpacity(0.3),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class _ChampionIcon extends StatelessWidget {
  final Champion champion;
  final EdgeInsets margin;

  const _ChampionIcon({
    required this.champion,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
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
            child: Icon(
              Icons.error,
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptySlot extends StatelessWidget {
  final EdgeInsets margin;
  final Color borderColor;

  const _EmptySlot({
    required this.margin,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );
  }
} 