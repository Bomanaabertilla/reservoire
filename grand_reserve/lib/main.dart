import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const GrandReserveApp());
}

class GrandReserveApp extends StatelessWidget {
  const GrandReserveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grand Reserve',
      theme: AppTheme.darkTheme,
      home: const Scaffold(
        body: Center(child: Text('Grand Reserve - In Development')),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
