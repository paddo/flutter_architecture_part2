import 'package:get_it/get_it.dart';
import 'package:time_tracking/core/backend_service.dart';
import 'package:time_tracking/core/nav_manager.dart';

GetIt sl = GetIt();

initServiceLocator() {
  sl.registerSingleton(NavManager());
  sl.registerSingleton(BackendService());
}
