import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/sr_controller.dart';
import 'package:lotuspmc/screen/widget/input.dart';
import 'package:lotuspmc/service/common.dart';
import '../service/style/color.dart';
import 'widget/appbar.dart';
import 'widget/text.dart';

class ServiceRequestScreen extends StatelessWidget {
  final SRController srController = Get.put(SRController());

  final RxString requestType = ''.obs;

  ServiceRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
              'IDENTIFY YOUR REQUEST TYPE',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => Column(
                children: [
                  _buildRadioTile("Interior Residence", requestType),
                  _buildRadioTile("Exterior Structure", requestType),
                  _buildRadioTile("Exterior Grounds", requestType),
                  _buildRadioTile("Housekeeping", requestType),
                  _buildRadioTile("Water Features", requestType),
                  _buildRadioTile("Storm Preparedness", requestType),
                  _buildRadioTile("Other", requestType),
                ],
              ),
            ),
            //Property / Grounds,Residence Exterior,Residence Interior,Housekeeping,Storm Preparedness,Additional Details
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
                final type = requestType.value;
                final details =
                    srController.additionalDetailsController.text.trim();

                if (type.isEmpty || details.isEmpty) {
                  showSnackbar(
                    "Error",
                    "Please fill out all required fields.",
                  );
                  return;
                }

                await srController.sendSRRequest(type);
                srController.additionalDetailsController.clear();
                requestType.value = '';
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
