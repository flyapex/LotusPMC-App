import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/service/style/color.dart';

import 'widget/appbar.dart';
import 'widget/button.dart';
import 'widget/date_time.dart';
import 'widget/text.dart';

class DepartureNofitication extends StatelessWidget {
  const DepartureNofitication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nDEPARTURE NOTIFICATION",
        backgroundColor: borderColor,
      ),
      body: SingleChildScrollView(
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
              onSubmit: () {},
            ),
            const SizedBox(height: 30),
            SubmitButton(title: 'SEND US A MESSAGE', onSubmit: () {}),
            SubmitButton(title: 'ENTER A SERVICE REQUEST', onSubmit: () {}),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
