import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  RxString selectedPaymentMethod = "card".obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  // void completePayment() {
  //   // Navigate to next screen or process payment
  //   Get.toNamed('/PaymentMethod');
  // }
}
