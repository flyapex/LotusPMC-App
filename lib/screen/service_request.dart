import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/screen/widget/input.dart';
import '../service/style/color.dart';
import 'widget/appbar.dart';
import 'widget/text.dart';
import 'package:lotuspmc/controller/property_controller.dart';

class ServiceRequestScreen extends StatelessWidget {
  final PropertyController propertyController = Get.find<PropertyController>();
  final TextEditingController detailsController = TextEditingController();
  final RxString requestType = ''.obs;

  ServiceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nSERVICE REQUEST",
        backgroundColor: accentBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'PLEASE LET US KNOW YOUR SERVICE NEEDS BELOW.\n'
              'FOR INTERIOR REQUESTS, PLEASE ENTER THE ROOM NUMBER WITH YOUR REQUEST.\n\n'
              'PLEASE REFER TO YOUR FLOOR PLAN IN THE PROPERTY INFORMATION SECTION FOR ROOM NUMBERS.',
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
            const SizedBox(height: 20.0),
            BigInputBox(
              controller: detailsController,
              onSubmit: () async {
                final type = requestType.value;
                final details = detailsController.text.trim();

                if (type.isEmpty || details.isEmpty) {
                  propertyController.showSnackbar(
                    "Error",
                    "Please fill out all required fields.",
                  );
                  return;
                }

                await propertyController.fetchServiceRequest(type, details);
                detailsController.clear();
                requestType.value = '';
              },
            ),
            const SizedBox(height: 40),
            Obx(
              () => propertyController.isServiceRequestLoading.value
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
