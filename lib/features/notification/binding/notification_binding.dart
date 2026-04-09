import 'package:get/get.dart';
import 'package:too_easy_fuel/features/notification/controller/notification_controller.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NotificationController>(
        () => NotificationController()
    );
  }

}