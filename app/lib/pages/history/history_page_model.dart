import 'package:rxdart/rxdart.dart';
import 'package:time_tracking/core/backend_service.dart';
import 'package:time_tracking/core/service_locator.dart';

class HistoryPageModel {
  final BehaviorSubject<List<HistoryItem>> history;

  HistoryPageModel() : history = sl<BackendService>().getHistory();
}
