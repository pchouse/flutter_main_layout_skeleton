import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:main_layout_skeleton/tab/tab_manager.dart';
import 'package:main_layout_skeleton/tab/tab_opened_item.dart';

class TabOpenedList extends StatefulWidget {
  TabOpenedList({super.key, this.selectTabTile = "Tab"});

  final _TabOpenedListState _mWidget = _TabOpenedListState();

  final String selectTabTile;

  /// Add a tab to the list
  addTab(TabOpenedItem tabOpenedItem) => _mWidget.addTab(tabOpenedItem);

  /// Remove the tab from the list
  removeTab(Key key) => _mWidget.removeTab(key);

  @override
  // ignore: no_logic_in_create_state
  State<TabOpenedList> createState() => _mWidget;
}

class _TabOpenedListState extends State<TabOpenedList> {
  _TabOpenedListState();

  /// The list of opened tabs
  final _mOpenedTabList = <TabOpenedItem>[];

  /// Add the tab to the list view
  addTab(TabOpenedItem tabOpenedItem) {
    setState(() {
      _mOpenedTabList.add(tabOpenedItem);
      _mOpenedTabList.sort((previous, next) {
        return previous.key == null ? -1 : previous.label.compareTo(next.label);
      });
    });
  }

  /// Remove the tab from list view
  removeTab(Key key) {
    var tabOpenedItem =
        _mOpenedTabList.where((element) => element.key == key).firstOrNull;

    if (tabOpenedItem == null) return;
    setState(() {
      _mOpenedTabList.remove(tabOpenedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 2),
      margin: const EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 2),
      width: 199,
      child: DropdownButton<Key>(
        value: null,
        items: [
          DropdownMenuItem(
            value: null,
            child: Text(widget.selectTabTile),
          ),
          ..._mOpenedTabList.mapIndexed<DropdownMenuItem<Key>>((index, label) {
            var label = _mOpenedTabList[index].label.length > 15
                ? "${_mOpenedTabList[index].label.substring(0, 15)}..."
                : _mOpenedTabList[index].label;

            return DropdownMenuItem(
              value: _mOpenedTabList[index].key,
              child: Text(label),
            );
          }).toList(),
        ],
        onChanged: (Key? key) {
          if (key == null) return;
          TabManager.setSelectedTabKey(key);
        },
      ),
    );
  }
}
