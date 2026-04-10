import 'package:get/get.dart';
import 'package:too_easy_fuel/features/onboarding/controller/onboarding_controller.dart';

import '../controller/fleet_controller.dart';

class FleetBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<FleetController>(
            () => FleetController());
  }
}
