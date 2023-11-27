import 'package:flutter/material.dart';
import 'package:main_layout_skeleton/main_layout/main_layout.dart';
import 'package:main_layout_skeleton/main_menu/main_menu.dart';
import 'package:main_layout_skeleton/tab/tab_manager.dart';
import 'package:intl/intl.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  final Key tab1Key = const Key("key_tab_1");
  final Key tab2Key = const Key("key_tab_2");

  @override
  Widget build(BuildContext context) {
    ThemeData lightTheme = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ));

    ThemeData darkTheme = ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ));

    return MainLayout(
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      mainMenu: MainMenu(
        title: Text(
          "The menu title",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
            color: lightTheme.colorScheme.error,
          ),
        ),
        menuItems: [
          ListTile(
            onTap: () {
              TabManager.addTab(
                const Icon(Icons.inbox),
                "The tab 1",
                Text(DateTime.now().toIso8601String()),
                tab1Key,
              );
            },
            leading: const Icon(
              Icons.inbox,
              color: Colors.black,
            ),
            trailing: const Text("99+"),
            title: const Text("Tab1"),
          ),
          ListTile(
            onTap: () {
              TabManager.addTab(
                null,
                "Tab lorem ipsum dolor sit amet consectetur adipisicing elit",
                Text(DateTime.now().toIso8601String()),
                tab2Key,
              );
            },
            leading: const Icon(
              Icons.inbox,
              color: Colors.black,
            ),
            title: const Text("Tab2"),
          ),
        ],
      ),
      appBarActions: [
        Text((DateFormat("yyyy-MM-dd").format(DateTime.now()))),
      ],
    );
  }
}
