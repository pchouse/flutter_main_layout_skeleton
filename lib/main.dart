import 'package:flutter/material.dart';
import 'package:main_layout_skeleton/main_menu/dark_mode_notifier.dart';
import 'package:main_layout_skeleton/start.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DarkModeNotifier(false)),
    //ChangeNotifierProvider(create: (context) => TabManager()),
  ], child: const Start()));
}

