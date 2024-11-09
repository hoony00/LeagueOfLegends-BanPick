import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants/colors.dart';
import '../../../core/models/champion.dart';
import '../../../core/models/pick_ban_state.dart';

class CompletionDialog extends StatelessWidget {
  final PickBanState state;

  const CompletionDialog({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: const Text(
        '밴픽 완료',
        style: TextStyle(color: AppColors.gold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTeamSummary('Blue Team', state.bluePicks, AppColors.primaryBlue),
          const SizedBox(height: 16),
          _buildTeamSummary('Red Team', state.redPicks, AppColors.primaryRed),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            '닫기',
            style: TextStyle(color: AppColors.gold),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamSummary(String teamName, List<Champion> picks, Color teamColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          teamName,
          style: TextStyle(
            color: teamColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: picks.map((champion) => CachedNetworkImage(
            imageUrl: champion.championImageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )).toList(),
        ),
      ],
    );
  }
} 