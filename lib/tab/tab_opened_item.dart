import 'package:flutter/foundation.dart';
/// The Tab to join the list
class TabOpenedItem {
  /// The label that will be show in the list
  String label;

  /// The tab Key that unique identify the tab
  Key? key;

  TabOpenedItem(this.label, this.key);
}
