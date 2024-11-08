import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/pick_ban/screens/pick_ban_screen.dart';
import 'core/constants/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoL Pick Ban',
      theme: AppTheme.darkTheme,
      home: const PickBanScreen(),
    );
  }
}
