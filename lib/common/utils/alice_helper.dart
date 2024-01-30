import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:injectable/injectable.dart';

@singleton
class AliceHelper {
  late Alice alice;

  AliceHelper() {
    _initAlice();
  }

  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  void _initAlice() {
    alice = Alice(
      showInspectorOnShake: true,
      darkTheme: true,
      navigatorKey: rootNavigatorKey,
    );
  }
}
