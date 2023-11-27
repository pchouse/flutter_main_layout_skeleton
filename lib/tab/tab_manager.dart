import 'package:flutter/material.dart';
import 'package:main_layout_skeleton/main_layout/main_layout.dart';
import 'package:main_layout_skeleton/tab/tab.dart' as m_tab;
import 'package:main_layout_skeleton/tab/tab_opened_item.dart';
import 'package:main_layout_skeleton/tab/tab_opened_list.dart';

class TabManager {
  static late MainLayout mainLayout;
  static late TabOpenedList tabOpenedList;
  static final List<m_tab.Tab> tabs = [];
  static int selectedTabIndex = 0;

  /// Add a tab to the stack
  static void addTab(Icon? icon, String label, Widget body, Key key) {
    if (setSelectedTabKey(key)) return;

    var tabTitleChildren = <Widget>[];
    if (icon != null) tabTitleChildren.add(icon);
    tabTitleChildren.add(Text(label));
    tabTitleChildren.add(
      SizedBox(
        height: 25,
        width: 25,
        child: GestureDetector(
            onTap: () {
              removeTab(key);
            },
            child: const Icon(Icons.close)),
      ),
    );

    Widget tabTitle = Row(
      children: tabTitleChildren,
    );

    tabs.add(m_tab.Tab(label, tabTitle, body, key));
    selectedTabIndex = tabs.length - 1 < 0 ? 0 : tabs.length - 1;
    mainLayout.rebuild();
    tabOpenedList.addTab(TabOpenedItem(label, key));
  }

  /// Remove tab from stack
  /// Returns true if the Tab exists in the Stack of false if not
  static void removeTab(Key key) {
    var length = tabs.length;

    if (length == 0) return;

    int? index;

    for (int n = 0; n < length; n++) {
      var element = tabs[n];
      if (element.key == key) {
        index = n;
        break;
      }
    }

    if (index == null) return;

    tabs.removeAt(index);
    selectedTabIndex = tabs.length - 1 < 0 ? 0 : tabs.length - 1;
    tabOpenedList.removeTab(key);
    mainLayout.rebuild();
  }

  /// Set the selected tab index
  static bool setSelectedTabKey(Key? key) {
    if (key == null) return false;
    int? index;
    var length = tabs.length;

    if (length == 0) return false;

    for (int n = 0; n < length; n++) {
      var element = tabs[n];
      if (element.key == key) {
        index = n;
        break;
      }
    }

    if (index == null) return false;

    if (selectedTabIndex == index) return true;

    selectedTabIndex = index;
    mainLayout.rebuild();
    return true;
  }

  /// Set the selected index
  static setSelectedIndex(int index) {
    selectedTabIndex = index;
    mainLayout.rebuild();
  }
}
