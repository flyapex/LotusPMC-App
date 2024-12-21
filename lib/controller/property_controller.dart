import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/api/api_property.dart';
import 'package:lotuspmc/model/concierge_request_model.dart';
import 'package:lotuspmc/model/porperty_info_model.dart';
import 'package:lotuspmc/model/pre_arrival_notification_model.dart';
import 'package:lotuspmc/model/response_model.dart';
import 'package:lotuspmc/model/service_request_model.dart';

class PropertyController extends GetxController {
  // Snackbar
  void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
    );
  } // Method to fetch property information

  var propertyInfo = Rxn<PropertyInformationResponse>();
  var isLoading = false.obs;

  void fetchPropertyInformation(int propertyId) async {
    try {
      isLoading.value = true;
      final info = await ApiServiceProperty.propertyInformationApi(propertyId);
      if (info != null) {
        propertyInfo.value = info;
      } else {
        showSnackbar("Error", "Failed to fetch property information.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  var serviceRequest = Rxn<ResponseModel>();
  var isServiceRequestLoading = false.obs;

  Future<void> fetchServiceRequest(String requestType, String details) async {
    try {
      isServiceRequestLoading.value = true;
      final info = await ApiServiceProperty.serviceRequestApi(
        ServiceRequestSendModel(
          srType: requestType,
          details: details,
          isAreaIdentified: "1",
          userId: "43",
        ),
      );

      if (info != null) {
        serviceRequest.value = info;
        showSnackbar("Success", info.message);
        await Future.delayed(const Duration(seconds: 1));
        Get.back(closeOverlays: true);
      } else {
        showSnackbar("Error", "Failed to submit service request.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isServiceRequestLoading.value = false;
    }
  }

  var isPreArrivalNotificationLoading = false.obs;

  Future<void> sendPreArrivalNotification(
    DateTime arrivalDateTime,
  ) async {
    try {
      isPreArrivalNotificationLoading.value = true;

      final notificationData = PreArrivalNotificationSendModel(
        date: arrivalDateTime.toIso8601String().split('T')[0],
        time: arrivalDateTime.toIso8601String().split('T')[1].split('.')[0],
        userId: "43",
      );

      final response =
          await ApiServiceProperty.preArrivalNotificationApi(notificationData);

      if (response != null) {
        showSnackbar("Success", response.message);
        await Future.delayed(const Duration(seconds: 2));
        Get.back(closeOverlays: true);
      } else {
        showSnackbar("Error", "Failed to send arrival notification.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isPreArrivalNotificationLoading.value = false;
    }
  }

  var isDepartureNotificationLoading = false.obs;

  Future<void> sendDepartureNofitication(
    DateTime arrivalDateTime,
  ) async {
    try {
      isDepartureNotificationLoading.value = true;

      final notificationData = PreArrivalNotificationSendModel(
        date: arrivalDateTime.toIso8601String().split('T')[0],
        time: arrivalDateTime.toIso8601String().split('T')[1].split('.')[0],
        userId: "43",
      );

      final response =
          await ApiServiceProperty.departureNofiticationApi(notificationData);

      if (response != null) {
        showSnackbar("Success", response.message);
        await Future.delayed(const Duration(seconds: 2));
        Get.back(closeOverlays: true);
      } else {
        showSnackbar("Error", "Failed to send departure notification.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isDepartureNotificationLoading.value = false;
    }
  }

  var isconciergeRequestLoading = false.obs;

  Future<void> sendConciergeRequest(String details) async {
    try {
      isconciergeRequestLoading.value = true;

      final data = ConciergeRequestSendModel(
        details: details,
        userId: "43",
      );

      final response = await ApiServiceProperty.conciergeRequestApi(data);

      if (response != null) {
        showSnackbar("Success", response.message);
        await Future.delayed(const Duration(seconds: 2));
        Get.back(closeOverlays: true);
      } else {
        showSnackbar("Error", "Failed to send concierge request.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isconciergeRequestLoading.value = false;
    }
  }

  var isHomeImprovementServicesLoading = false.obs;

  Future<void> sendHomeImprovementServicesRequest(String details) async {
    try {
      isHomeImprovementServicesLoading.value = true;

      final data = ConciergeRequestSendModel(
        details: details,
        userId: "43",
      );

      final response =
          await ApiServiceProperty.homeImprovementServicesApi(data);

      if (response != null) {
        showSnackbar("Success", response.message);
        await Future.delayed(const Duration(seconds: 2));
        Get.back(closeOverlays: true);
      } else {
        showSnackbar("Error", "Failed to send concierge request.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isHomeImprovementServicesLoading.value = false;
    }
  }
}
