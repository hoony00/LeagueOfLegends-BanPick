import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pick_ban_provider.dart';
import '../../../core/constants/colors.dart';

class GameDrawer extends ConsumerWidget {
  const GameDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.gold,
                    width: 0.5,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'LOL DRAFT',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.refresh_rounded,
                color: AppColors.gold,
              ),
              title: const Text(
                '게임 리셋',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.surface,
                    title: const Text(
                      '게임 리셋',
                      style: TextStyle(color: AppColors.gold),
                    ),
                    content: const Text(
                      '정말로 게임을 리셋하시겠습니까?',
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          '취소',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(pickBanProvider.notifier).resetGame();
                          Navigator.pop(context); // 다이얼로그 닫기
                          Navigator.pop(context); // 드로어 닫기
                        },
                        child: const Text(
                          '리셋',
                          style: TextStyle(color: AppColors.primaryRed),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(color: AppColors.gold, height: 0.5),
            // 추가 메뉴 항목들을 여기에 넣을 수 있습니다
          ],
        ),
      ),
    );
  }
} 