import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/property_controller.dart';
import 'package:lotuspmc/screen/widget/button.dart';
import 'package:lotuspmc/screen/widget/date_time.dart';
import 'package:lotuspmc/service/style/color.dart';
import 'widget/appbar.dart';
import 'widget/text.dart';

class PreArrivalNotification extends StatefulWidget {
  const PreArrivalNotification({super.key});

  @override
  State<PreArrivalNotification> createState() => _PreArrivalNotificationState();
}

class _PreArrivalNotificationState extends State<PreArrivalNotification> {
  final PropertyController propertyController = Get.find();
  DateTime? selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyappBar(
          title: "\nDOCUMENTS",
          backgroundColor: mutedText,
        ),
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWithBorder(title: 'WELCOME HOME'),
                  Text(
                    'PLEASE LET US KNOW WHEN YOU WILL BE ARRIVING AT YOUR HOME AND HOW WE MAY BE ABLE TO ASSIST IN GETTING EVERYTHING READY FOR YOUR ARRIVAL.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: secondary,
                    ),
                  ).paddingSymmetric(vertical: 20),
                  CustomDateTimePicker(
                    title: "ARRIVAL DATE",
                    subtitle: "EST'D ARRIVAL TIME",
                    initialDate: DateTime.now(),
                    onDateTimeChanged: (DateTime dateTime) {
                      // Handle the selected date-time here
                      debugPrint('Selected DateTime: $dateTime');
                      selectedDateTime = dateTime;
                    },
                  ),
                  const TitleWithBorder(title: 'ARRIVAL PREFERENCES')
                      .paddingOnly(
                    top: 20,
                  ),
                  Text(
                    'CLICK ON FIELD TO ADJUST SAVED PREFERENCES.',
                    style: TextStyle(
                      color: secondary,
                    ),
                  ),
                  const SubTitleWithBorder(
                    title: 'TEMPERATURE SETTINGS',
                    subtitle: '72 FC',
                  ),
                  const SubTitleWithBorder(
                    title: 'WINDOW TREATMENTS',
                    subtitle: 'ALL OPEN',
                  ),
                  const SubTitleWithBorder(
                    title: 'OUTDOOR LIGHTS',
                    subtitle: 'ALL ON',
                  ),
                  const SubTitleWithBorder(
                    title: 'INDOOR LIGHTS',
                    subtitle: 'ALL ON',
                  ),
                  SubmitButton(
                    title:
                        propertyController.isPreArrivalNotificationLoading.value
                            ? "Submitting..."
                            : "SUBMIT",
                    onSubmit: () async {
                      if (!propertyController
                          .isPreArrivalNotificationLoading.value) {
                        // if (selectedDateTime == null) {
                        //   Get.snackbar("Error", "Please select date and time.");
                        //   return;
                        // }

                        propertyController.sendPreArrivalNotification(
                          selectedDateTime!,
                        );
                      }
                    },
                  ),
                  Text(
                    'FOR ANY ADDITIONAL SPECIAL REQUESTS REGARDING YOUR ARRIVAL, PLEASE ENTER THOSE IN THE CONCIERGE TAB.',
                    style: TextStyle(
                      color: secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingSymmetric(vertical: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: SubmitButton(
                      title: 'CONCIERGE TAB',
                      onSubmit: () {},
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 24),
            );
          },
        ));
  }
}
