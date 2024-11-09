import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/pick_ban/screens/pick_ban_screen.dart';
import 'core/constants/theme.dart';

void main() {
  runApp(
     ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
      theme: AppTheme.darkTheme,
      home: const PickBanScreen(),
      builder: (context, child) {
        return Scaffold(
          body: child,
        );
      },
    );
  }
}
