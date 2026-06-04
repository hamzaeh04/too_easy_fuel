import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_easy_fuel/core/services/base_services.dart';
import 'package:too_easy_fuel/features/fleet/model/add_equipment_model.dart';
import 'package:too_easy_fuel/features/fleet/model/add_vehical_model.dart';

import '../../../core/services/apiendpoints.dart';

class FleetController extends GetxController{
  // RxBool isChecked = false.obs;
  // RxBool isChecked1 = false.obs;
  // RxBool isChecked2 = false.obs;
  // RxBool isChecked3 = false.obs;
  // RxBool isChecked4 = false.obs;

  RxBool isChecked = false.obs;
  RxBool showExtraFields = false.obs; // 👈 instead of isChecked1,2,3...






  @override
  void onInit() {
    getVehicles();
    getEquipment();
    super.onInit();
  }
  RxBool isLoading = false.obs;
  Rx<VehiclesResponse?> vehiclesResponse = Rx<VehiclesResponse?>(null);
  final BaseService baseService = BaseService();

  RxBool isLoadingEquipment = false.obs;
  Rx<EquipmentResponse?> equipmentResponse = Rx<EquipmentResponse?>(null);



  Future<VehiclesResponse?> getVehicles() async {
    try {
      isLoading.value = true;

      final response = await baseService.baseGetAPI(
        ApiEndPoints.getVehicles,
      );

      print(response);

      if (response['success'] == true || response['statusCode'] == 200) {
        final model = VehiclesResponse.fromJson(response);

        vehiclesResponse.value = model;

        print("message: ${response['message']}");

        return model;
      } else {
        debugPrint(
          'Get vehicles failed: ${response['statusCode']}',
        );
        return null;
      }
    } catch (e) {
      debugPrint("Vehicle Error: $e");
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<EquipmentResponse?> getEquipment() async {
    try {
      isLoadingEquipment.value = true;

      final response = await baseService.baseGetAPI(
        ApiEndPoints.getEquipment,
      );

      print(response);

      if (response['success'] == true || response['statusCode'] == 200) {
        final model = EquipmentResponse.fromJson(response);

        equipmentResponse.value = model;

        print("message: ${response['message']}");

        return model;
      } else {
        debugPrint(
          'Get vehicles failed: ${response['statusCode']}',
        );
        return null;
      }
    } catch (e) {
      debugPrint("Vehicle Error: $e");
      return null;
    } finally {
      isLoadingEquipment.value = false;
    }
  }
  Future<bool> deleteVehical(String vehicalId,) async {
    try {
      // Call your base service
      final data = await baseService.baseDeleteAPI(
        ApiEndPoints.delteVehical(vehicalId),
        loading: true,
      );

      // If data is a Map, check success
      if (data != null && data is Map<String, dynamic>) {

        return data['success'] == true;

      }


      print("Failed to delete vehicle. Response: $data");
      return false;
    } catch (e) {
      print("Error deleting vehicle: $e");
      return false;
    }
  }
  Future<bool> deleteEquipment(String equipmentId) async {
    try {
      // Call your base service
      final data = await baseService.baseDeleteAPI(
        ApiEndPoints.delteEquipment(equipmentId),
        loading: true,
      );

      // If data is a Map, check success
      if (data != null && data is Map<String, dynamic>) {

        return data['success'] == true;

      }


      print("Failed to delete equipment. Response: $data");
      return false;
    } catch (e) {
      print("Error deleting equipment: $e");
      return false;
    }
  }
}
