import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:main_layout_skeleton/main_menu/dark_mode_notifier.dart';
import 'package:main_layout_skeleton/main_menu/main_menu_item.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  MainMenu({
    super.key,
    required Text title,
    required List<ListTile> menuItems,
  }) {
    mTitle = title;
    mMenuItems = menuItems;
  }

  /// The menu title
  late final Text mTitle;

  /// The menu items
  late final List<ListTile> mMenuItems;

  @override
  Widget build(BuildContext context) {
    var mMenuItemsBoxHeight = MediaQuery.of(context).size.height - 109;

    var closeMenu = Scaffold.of(context).openEndDrawer;

    Widget? trailing;

    try {
      final darkModeNotifier = Provider.of<DarkModeNotifier>(context);

      trailing = GestureDetector(
          onTap: () => darkModeNotifier.changeMode(),
          child: Icon(
            darkModeNotifier.isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.dark_mode,
          ));
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    return IgnorePointer(
      ignoring: false,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onTap: () => closeMenu(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: mTitle,
                    trailing: trailing,
                  ),
                  SizedBox(
                    height: mMenuItemsBoxHeight,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          ...List.generate(
                            mMenuItems.length,
                            (index) => MainMenuItem.closeMenu(
                              listTile: mMenuItems[index],
                              closeMainMenu: closeMenu,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
