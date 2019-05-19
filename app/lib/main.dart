import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:time_tracking/core/nav_manager.dart';
import 'package:time_tracking/core/service_locator.dart';

part 'main.g.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  initServiceLocator();
  runApp(MyApp());
}

@widget
Widget myApp() {
  final navManager = sl<NavManager>();

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: Scaffold(
      body: Navigator(
        key: navManager.navigatorKey,
        onGenerateRoute: navManager.onGenerateRoute,
      ),
      bottomNavigationBar: BottomNav(navManager),
    ),
  );
}

@widget
Widget bottomNav(NavManager navManager) => BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xFF82BDBF),
      currentIndex: useStream(navManager.currentIndex).data ?? 0,
      onTap: navManager.navigateToIndex,
      items: navManager.items
          .map((item) => BottomNavigationBarItem(icon: Icon(item.icon), title: Text(item.title)))
          .toList(),
    );
