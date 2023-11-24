import 'package:flutter/material.dart';

class MainMenuItem extends ListTile {
  const MainMenuItem({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.trailing,
    super.isThreeLine = false,
    super.dense,
    super.visualDensity,
    super.shape,
    super.style,
    super.selectedColor,
    super.iconColor,
    super.textColor,
    super.titleTextStyle,
    super.subtitleTextStyle,
    super.leadingAndTrailingTextStyle,
    super.contentPadding,
    super.enabled = true,
    super.onTap,
    super.onLongPress,
    super.onFocusChange,
    super.mouseCursor,
    super.selected = false,
    super.focusColor,
    super.hoverColor,
    super.splashColor,
    super.focusNode,
    super.autofocus = false,
    super.tileColor,
    super.selectedTileColor,
    super.enableFeedback,
    super.horizontalTitleGap,
    super.minVerticalPadding,
    super.minLeadingWidth,
    super.titleAlignment,
  });

  factory MainMenuItem.closeMenu({
    Key? key,
    required ListTile listTile,
    required Function closeMainMenu,
  }) {
    return MainMenuItem(
      key: listTile.key,
      leading: listTile.leading,
      title: listTile.title,
      subtitle: listTile.subtitle,
      trailing: listTile.trailing,
      isThreeLine: listTile.isThreeLine,
      dense: listTile.dense,
      visualDensity: listTile.visualDensity,
      shape: listTile.shape,
      style: listTile.style,
      selectedColor: listTile.selectedColor,
      iconColor: listTile.iconColor,
      textColor: listTile.textColor,
      titleTextStyle: listTile.titleTextStyle,
      subtitleTextStyle: listTile.subtitleTextStyle,
      leadingAndTrailingTextStyle: listTile.leadingAndTrailingTextStyle,
      contentPadding: listTile.contentPadding,
      enabled: listTile.enabled,
      onTap: () {
        if (listTile.onTap != null) listTile.onTap!();
        closeMainMenu();
      },
      onLongPress: () {
        if (listTile.onLongPress != null) listTile.onLongPress!();
        closeMainMenu();
      },
      onFocusChange: listTile.onFocusChange,
      mouseCursor: listTile.mouseCursor,
      selected: listTile.selected,
      focusColor: listTile.focusColor,
      hoverColor: listTile.hoverColor,
      splashColor: listTile.splashColor,
      focusNode: listTile.focusNode,
      autofocus: listTile.autofocus,
      tileColor: listTile.tileColor,
      selectedTileColor: listTile.selectedTileColor,
      enableFeedback: listTile.enableFeedback,
      horizontalTitleGap: listTile.horizontalTitleGap,
      minVerticalPadding: listTile.minVerticalPadding,
      minLeadingWidth: listTile.minLeadingWidth,
      titleAlignment: listTile.titleAlignment,
    );
  }

}
