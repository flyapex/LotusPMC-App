import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/sr_controller.dart';
import 'package:lotuspmc/screen/sr/dropdown.dart';
import 'package:lotuspmc/screen/widget/input.dart';
import 'package:lotuspmc/service/common.dart';
import '../service/style/color.dart';
import 'widget/appbar.dart';
import 'widget/text.dart';

class ServiceRequestScreen extends StatelessWidget {
  final SRController srController = Get.put(SRController());
  ServiceRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    srController.fetchRoom();
    return Scaffold(
      appBar: MyappBar(
        title: "\nSERVICE REQUEST",
        backgroundColor: accentBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'Please send a brief description of how we can assist. For Interior requests, please refer to your floor plan and note the room designation on your Interior Request so that we will know where the item is. Click here to open your Floor Plans.\n',
              style: TextStyle(
                color: secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            const TitleWithBorder(title: 'SUBMIT REQUEST'),
            const Text(
              'IDENTIFY YOUR REQUEST TYPE(*)',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => Column(
                children: [
                  _buildRadioTile(
                      "Interior Residence", srController.requestType),
                  _buildRadioTile(
                      "Exterior Structure", srController.requestType),
                  _buildRadioTile("Exterior Grounds", srController.requestType),
                  _buildRadioTile("Housekeeping", srController.requestType),
                  _buildRadioTile("Water Features", srController.requestType),
                  _buildRadioTile(
                      "Storm Preparedness", srController.requestType),
                  _buildRadioTile("Other", srController.requestType),
                ],
              ),
            ),
            SmallInputBox(
              controller: srController.propertyGroundsController,
              title: 'Property / Grounds',
              maxLines: 2,
              onSubmit: () {},
            ).paddingSymmetric(vertical: 20),
            SmallInputBox(
              controller: srController.residenceExteriorController,
              title: 'Residence Exterior',
              maxLines: 2,
              onSubmit: () {},
            ).paddingSymmetric(vertical: 20),
            SmallInputBox(
              controller: srController.residenceInteriorController,
              title: 'Residence Interior',
              maxLines: 2,
              onSubmit: () {},
            ).paddingSymmetric(vertical: 20),
            Obx(() {
              if (srController.roomData.value == null) {
                return Container();
              }
              return DropDownRoom(
                items: srController.roomData.value!.data!.toList(),
                onChanged: (value) {
                  srController.roomDesignation = value;
                },
              );
            }),
            SmallInputBox(
              controller: srController.housekeepingController,
              title: 'Housekeeping',
              maxLines: 2,
              onSubmit: () {},
            ).paddingSymmetric(vertical: 20),
            SmallInputBox(
              controller: srController.stormPreparednessController,
              title: 'Storm Preparedness',
              maxLines: 2,
              onSubmit: () {},
            ).paddingSymmetric(vertical: 20),
            const SizedBox(height: 20.0),
            BigInputBox(
              controller: srController.additionalDetailsController,
              onSubmit: () async {
                final type = srController.requestType.value;
                // final details =
                //     srController.additionalDetailsController.text.trim();

                if (type.isEmpty) {
                  showSnackbar(
                    "Error",
                    "Please Select Service Request Type",
                  );
                  return;
                }

                await srController.sendSRRequest();
                srController.additionalDetailsController.clear();
                srController.requestType.value = '';
                srController.propertyGroundsController.clear();
                srController.residenceExteriorController.clear();
                srController.residenceInteriorController.clear();
                srController.housekeepingController.clear();
                srController.stormPreparednessController.clear();
              },
            ),
            const SizedBox(height: 40),
            Obx(
              () => srController.isSRLoadingSend.value
                  ? const Center(child: CircularProgressIndicator())
                  : Container(),
            ),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }

  Widget _buildRadioTile(String title, RxString groupValue) {
    return RadioListTile<String>(
      title: Text(title),
      value: title,
      groupValue: groupValue.value,
      contentPadding: EdgeInsets.zero,
      onChanged: (value) {
        groupValue.value = value!;
      },
    );
  }
}
