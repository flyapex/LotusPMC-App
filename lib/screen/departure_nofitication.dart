import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/property_controller.dart';
import 'package:lotuspmc/service/style/color.dart';

import 'widget/appbar.dart';
import 'widget/button.dart';
import 'widget/date_time.dart';
import 'widget/text.dart';

class DepartureNofitication extends StatelessWidget {
  const DepartureNofitication({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyController propertyController = Get.find();
    DateTime? selectedDateTime = DateTime.now();
    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nDEPARTURE NOTIFICATION",
        backgroundColor: borderColor,
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithBorder(title: 'WELCOME HOME'),
                Text(
                  'PLEASE LET US KNOW WHEN YOU EXPECT TO BE DEPARTING AND IF THERE IS ANYTHING WE CAN ASSIST YOU WITH OR ITEMS NEEDING ATTENTION FOLLOWING YOUR DEPARTURE.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: secondary,
                  ),
                ).paddingSymmetric(vertical: 20),
                CustomDateTimePicker(
                  title: "ARRIVAL DATE",
                  subtitle: "DEPARTURE TIME",
                  initialDate: DateTime.now(),
                  onDateTimeChanged: (DateTime selectedDateTime) {
                    // Handle the selected date-time here
                    debugPrint('Selected DateTime: $selectedDateTime');
                  },
                ),
                SubmitButton(
                  title: propertyController.isDepartureNotificationLoading.value
                      ? "Submitting..."
                      : "SUBMIT",
                  onSubmit: () async {
                    if (!propertyController
                        .isDepartureNotificationLoading.value) {
                      // if (selectedDateTime == null) {
                      //   Get.snackbar("Error", "Please select date and time.");
                      //   return;
                      // }

                      propertyController.sendDepartureNofitication(
                        selectedDateTime,
                      );
                    }
                  },
                ),
                const SizedBox(height: 30),
                SubmitButton(title: 'SEND US A MESSAGE', onSubmit: () {}),
                SubmitButton(title: 'ENTER A SERVICE REQUEST', onSubmit: () {}),
              ],
            ).paddingSymmetric(horizontal: 24),
          );
        },
      ),
    );
  }
}
