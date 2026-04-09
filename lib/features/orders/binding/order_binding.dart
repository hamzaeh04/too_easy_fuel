import 'package:get/get.dart';
import 'package:too_easy_fuel/features/orders/controller/order_controller.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
        () => OrderController()
    );
  }

}