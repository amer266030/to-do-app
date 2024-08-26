import 'package:get_it/get_it.dart';
import 'package:interactions_app/managers/navigation_mgr.dart';
import '../managers/data_mgr.dart';

class DIContainer {
  static void setup() {
    GetIt.I.registerSingleton<DataMgr>(DataMgr());
    GetIt.I.registerSingleton<NavMgr>(NavMgr());
  }
}
