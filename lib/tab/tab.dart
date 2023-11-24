import 'package:flutter/material.dart';

class Tab {
  const Tab(this.label, this.title, this.body, this.key);

  final String label;
  final Widget title;
  final Widget body;
  final Key key;
}
