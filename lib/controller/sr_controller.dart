import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/api/api_sr.dart';
import 'package:lotuspmc/api/common.dart';
import 'package:lotuspmc/model/sr/sr_open.dart';
import 'package:lotuspmc/model/sr/sr_send.dart';
import 'package:lotuspmc/service/common.dart';

class SRController extends GetxController {
  TextEditingController propertyGroundsController = TextEditingController();
  TextEditingController residenceExteriorController = TextEditingController();
  TextEditingController residenceInteriorController = TextEditingController();
  TextEditingController housekeepingController = TextEditingController();
  TextEditingController stormPreparednessController = TextEditingController();
  TextEditingController additionalDetailsController = TextEditingController();

  var isSRLoadingSend = false.obs;

  Future<void> sendSRRequest(String details) async {
    try {
      isSRLoadingSend.value = true;

      final data = ServiceRequestSendModel(
        details: details,
        userId: userID,
        srType: "Service Request",
        isAreaIdentified: '',
      );

      final response = await ApiServiceSR.srSendApi(data);

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
      isSRLoadingSend.value = false;
    }
  }

  var srOpenData = Rxn<SrReciveModel>();
  var isLoading = false.obs;

  void fetchSROpen() async {
    try {
      isLoading.value = true;
      final info = await ApiServiceSR.srOpenApi();
      if (info != null) {
        srOpenData.value = info;
      } else {
        showSnackbar("Error", "Failed to fetch property information.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  var srCompletedData = Rxn<SrReciveModel>();
  var isLoadingCompleted = false.obs;

  void fetchSRCompleted() async {
    try {
      isLoadingCompleted.value = true;
      final info = await ApiServiceSR.srCompletedApi();
      if (info != null) {
        srCompletedData.value = info;
      } else {
        showSnackbar("Error", "Failed to fetch property information.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isLoadingCompleted.value = false;
    }
  }

  var srDeniedData = Rxn<SrReciveModel>();
  var isLoadingDenied = false.obs;

  void fetchSRDenied() async {
    try {
      isLoadingDenied.value = true;
      final info = await ApiServiceSR.srDeniedApi();
      if (info != null) {
        srDeniedData.value = info;
      } else {
        showSnackbar("Error", "Failed to fetch property information.");
      }
    } catch (e) {
      showSnackbar("Error", "An error occurred: $e");
    } finally {
      isLoadingDenied.value = false;
    }
  }
}
