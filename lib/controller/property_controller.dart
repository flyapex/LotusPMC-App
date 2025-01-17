import 'package:get/get.dart';
import 'package:lotuspmc/api/api_property.dart';
import 'package:lotuspmc/model/porperty_info_model.dart';
import 'package:lotuspmc/model/pre_arrival_notification_model.dart';
import 'package:lotuspmc/service/common.dart';

import 'db_controller.dart';
import 'package:get/get.dart' as getx;

String userID = getx.Get.find<DBController>().getUserID()!;

class PropertyController extends GetxController {
  var propertyInfo = Rxn<PropertyInformationResponse>();
  var isLoading = false.obs;

  void fetchPropertyInformation() async {
    try {
      isLoading.value = true;
      final info =
          await ApiServiceProperty.propertyInformationApi(int.parse(userID));
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

  // var serviceRequest = Rxn<ResponseModel>();
  // var isServiceRequestLoading = false.obs;

  // Future<void> fetchServiceRequest(String requestType, String details) async {
  //   try {
  //     isServiceRequestLoading.value = true;
  //     final info = await ApiServiceSR.srSendApi(
  //       SrSendModel(
  //         srType: requestType,
  //         details: details,
  //         userId: userID,
  //         propertyGrounds: pro,
  //         residenceExterior: '',
  //         residenceInterior: '',
  //         roomDesignation: '',
  //         housekeeping: '',
  //         stormPreparedness: '',
  //       ),
  //     );

  //     if (info != null) {
  //       serviceRequest.value = info;
  //       showSnackbar("Success", info.message);
  //       await Future.delayed(const Duration(seconds: 1));
  //       Get.back(closeOverlays: true);
  //     } else {
  //       showSnackbar("Error", "Failed to submit service request.");
  //     }
  //   } catch (e) {
  //     showSnackbar("Error", "An error occurred: $e");
  //   } finally {
  //     isServiceRequestLoading.value = false;
  //   }
  // }

  var isPreArrivalNotificationLoading = false.obs;

  Future<void> sendPreArrivalNotification(
    DateTime arrivalDateTime,
  ) async {
    try {
      isPreArrivalNotificationLoading.value = true;

      final notificationData = PreArrivalNotificationSendModel(
        date: arrivalDateTime.toIso8601String().split('T')[0],
        time: arrivalDateTime.toIso8601String().split('T')[1].split('.')[0],
        userId: userID,
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
}
