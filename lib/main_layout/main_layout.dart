import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:main_layout_skeleton/main_menu/dark_mode_notifier.dart';
import 'package:main_layout_skeleton/main_menu/main_menu.dart';
import 'package:main_layout_skeleton/tab/tab_manager.dart';
import 'package:main_layout_skeleton/tab/tab_opened_list.dart';
import 'package:main_layout_skeleton/help/scroll_behavior.dart'
    as m_scroll_behavior;
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  MainLayout({
    super.key,
    this.textDirection = TextDirection.ltr,
    this.localizationsDelegates = const [],
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.lightTheme,
    this.darkTheme,
    //this.isDarkMode = false,
    this.title = "",
    required this.mainMenu,
    this.appBarTitle,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.floatingActionButtonAnimator,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.floatingActionButtonLocation,
    this.persistentFooterButtons,
    this.resizeToAvoidBottomInset,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerScrimColor,
    this.endDrawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBodyBehindAppBar = false,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.primary = true,
    this.restorationId,
    this.extendBody = false,
    this.drawerEnableOpenDragGesture = true,
  }) {
    _mTabOpenedList = TabOpenedList();
    TabManager.mainLayout = this;
    TabManager.tabOpenedList = _mTabOpenedList;
    // _mMainLayoutState = _MainLayoutState(darkMode: isDarkMode);
    _mMainLayoutState = _MainLayoutState();
  }

  late final _MainLayoutState _mMainLayoutState;
  late final TabOpenedList _mTabOpenedList;

  final TextDirection textDirection;
  final String title;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  //final bool isDarkMode;
  final MainMenu mainMenu;
  final Text? appBarTitle;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final AlignmentDirectional persistentFooterAlignment;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget>? persistentFooterButtons;
  final bool? resizeToAvoidBottomInset;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final Color? drawerScrimColor;
  final Widget? endDrawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBodyBehindAppBar;
  final void Function(bool)? onDrawerChanged;
  final void Function(bool)? onEndDrawerChanged;
  final bool primary;
  final String? restorationId;
  final bool extendBody;
  final bool drawerEnableOpenDragGesture;

  void rebuild() => _mMainLayoutState.rebuild();

  // void changeDarkMode() {
  //   _mMainLayoutState.darkMode = !_mMainLayoutState.darkMode;
  //   rebuild();
  // }

  @override
  // ignore: no_logic_in_create_state
  State<MainLayout> createState() => _mMainLayoutState;
}

class _MainLayoutState extends State<MainLayout> with TickerProviderStateMixin {
  // _MainLayoutState({
  //    required this.darkMode
  // });

  _MainLayoutState();

  late TabController _mTabController;

  //bool darkMode;

  /// Init state, is called whenever the widget is rebuilt
  @override
  void initState() {
    _mTabController = TabController(
      length: TabManager.tabs.length,
      vsync: this,
      initialIndex: TabManager.selectedTabIndex,
    );
    super.initState();
  }

  /// Rebuild the  widget
  void rebuild() {
    widget._mTabOpenedList.key;
    _mTabController = TabController(
      length: TabManager.tabs.length,
      vsync: this,
      initialIndex: TabManager.selectedTabIndex,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final darkModeNotifier = Provider.of<DarkModeNotifier>(context);
    bool darkMode = darkModeNotifier.isDarkMode;

    var lightTheme = widget.lightTheme ?? Theme.of(context);
    var darkTheme = widget.darkTheme ?? Theme.of(context);
    var theme = darkMode ? darkTheme : lightTheme;

    return Directionality(
      textDirection: widget.textDirection,
      child: MaterialApp(
        scrollBehavior: m_scroll_behavior.ScrollBehavior(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
        title: widget.title,
        localizationsDelegates: widget.localizationsDelegates,
        supportedLocales: widget.supportedLocales,
        home: Scaffold(
          drawer: Drawer(child: widget.mainMenu),
          appBar: AppBar(
            backgroundColor: theme.colorScheme.inversePrimary,
            title: widget.appBarTitle,
            actions: [...[], widget._mTabOpenedList],
          ),
          body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: widget.textDirection,
                children: [
                  TabBar(
                    isScrollable: true,
                    controller: _mTabController,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).hintColor,
                    onTap: (int tabIndex) =>
                        TabManager.setSelectedIndex(tabIndex),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                      ),
                    ),
                    tabs: List.generate(
                      TabManager.tabs.length,
                      (index) => TabManager.tabs[index].title,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _mTabController,
                      children: List.generate(
                        TabManager.tabs.length,
                        (index) => TabManager.tabs[index].body,
                      ),
                    ),
                  )
                ]),
          ),
          floatingActionButton: widget.floatingActionButton,
          bottomNavigationBar: widget.bottomNavigationBar,
          bottomSheet: widget.bottomSheet,
          backgroundColor: widget.backgroundColor,
          floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
          persistentFooterAlignment: widget.persistentFooterAlignment,
          floatingActionButtonLocation: widget.floatingActionButtonLocation,
          persistentFooterButtons: widget.persistentFooterButtons,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          drawerDragStartBehavior: widget.drawerDragStartBehavior,
          drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
          drawerScrimColor: widget.drawerScrimColor,
          endDrawer: widget.endDrawer,
          endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          onDrawerChanged: widget.onDrawerChanged,
          onEndDrawerChanged: widget.onEndDrawerChanged,
          primary: widget.primary,
          restorationId: widget.restorationId,
          extendBody: widget.extendBody,
          drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        ),
      ),
    );
  }
}
