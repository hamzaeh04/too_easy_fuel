import 'package:get/get.dart';
import 'package:too_easy_fuel/features/home/views/home_screen.dart';
import 'package:too_easy_fuel/features/orders/views/order_screen.dart';
import 'package:too_easy_fuel/features/fleet/views/fleet_screen.dart';
import 'package:too_easy_fuel/features/profile/views/profile_screen.dart';
import 'package:flutter/material.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeScreen(),
    OrderScreen(),
    FleetScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
