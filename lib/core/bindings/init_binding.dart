import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    // SharedPreferences is already initialized and registered in main.dart
  }
}
