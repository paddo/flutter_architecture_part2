import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class HistoryItem {
  final Duration duration;
  final DateTime dateTime;

  HistoryItem({@required this.duration, @required this.dateTime});
}

class BackendService {
  final BehaviorSubject<List<HistoryItem>> history;

  BackendService() : history = BehaviorSubject.seeded([]);

  BehaviorSubject<List<HistoryItem>> getHistory() => history;

  addToHistory(Duration duration) =>
      history.add(history.value..insert(0, HistoryItem(duration: duration, dateTime: DateTime.now())));
}
