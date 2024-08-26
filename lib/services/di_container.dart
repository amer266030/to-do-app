import 'package:get_it/get_it.dart';
import '../model/app_model.dart';

class DIContainer {
  static void setup() {
    GetIt.I.registerSingleton<AppModel>(AppModel());
  }
}
