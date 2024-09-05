import 'package:ctmd_app/components/ui/text-list.dart';
import 'package:ctmd_app/utils/tts-speed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(child: TextList()),
    );
  }
}
