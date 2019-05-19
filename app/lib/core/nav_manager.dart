import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:time_tracking/pages/history/history_page.dart';
import 'package:time_tracking/pages/timer/timer_page.dart';

class NavItem {
  final IconData icon;
  final String title;
  final String route;
  final WidgetBuilder builder;

  NavItem({@required this.icon, @required this.title, @required this.route, @required this.builder});
}

class NavManager {
  final GlobalKey<NavigatorState> navigatorKey;
  final BehaviorSubject<int> currentIndex;
  final List<NavItem> items;
  final String defaultRoute;

  NavManager()
      : navigatorKey = GlobalKey<NavigatorState>(),
        currentIndex = BehaviorSubject(),
        items = [
          NavItem(icon: Icons.timer, title: 'Timer', route: '/', builder: (_) => TimerPage()),
          NavItem(icon: Icons.history, title: 'History', route: '/history', builder: (_) => HistoryPage()),
        ],
        defaultRoute = '/';

  Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(builder: items.singleWhere((item) => item.route == settings.name).builder);

  navigateToIndex(int index) {
    if (currentIndex.hasValue && index == currentIndex.value) return;
    navigatorKey.currentState.pushReplacementNamed(items[index].route);
    currentIndex.add(index);
  }
}
