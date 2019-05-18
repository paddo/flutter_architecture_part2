import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:time_tracking/pages/history/history_page.dart';
import 'package:time_tracking/pages/timer/timer_page.dart';

part 'main.g.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

@widget
Widget myApp() {
  final navigatorKey = GlobalKey<NavigatorState>();

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: Scaffold(
      body: Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => TimerPage());
              break;
            case '/history':
              return MaterialPageRoute(builder: (_) => HistoryPage());
              break;
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xFF82BDBF),
        onTap: (index) {
          switch (index) {
            case 0:
              navigatorKey.currentState.pushReplacementNamed('/');
              break;
            case 1:
              navigatorKey.currentState.pushReplacementNamed('/history');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.timer), title: Text('Timer')),
          BottomNavigationBarItem(icon: Icon(Icons.history), title: Text('History')),
        ],
      ),
    ),
  );
}
