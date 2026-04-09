import 'package:get/get.dart';

class NotificationController extends GetxController{
  var selectedFilter = 'All'.obs; // Filter: All / Read / Unread
  void setFilter(String filter) {
    selectedFilter.value = filter;
  }
}