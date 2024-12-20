import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/property_controller.dart';
import 'package:lotuspmc/screen/property_info.dart';
import 'package:lotuspmc/screen/service_request.dart';
import 'package:lotuspmc/service/style/color.dart';

import 'concierge_request.dart';
import 'departure_nofitication.dart';
import 'documents.dart';
import 'home_improvement_services.dart';
import 'pre_arrival_notification.dart';
import 'widget/button.dart';
import 'widget/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final PropertyController propertyController = Get.put(PropertyController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset(
              'assets/images/logo.png',
              height: 70,
            ),
            const SizedBox(height: 26),
            Text(
              'WELCOME MR & MRS COLAMARINO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const TitleWithBorder(title: 'PROPERTY MANAGEMENT'),
            ActionButton(
              text: 'PROPERTY INFORMATION',
              color: lightBackground,
              onTap: () {
                Get.to(() => const PropertyInformationScreen());
              },
            ),
            ActionButton(
              text: 'SERVICE REQUEST',
              color: accentBackground,
              onTap: () {
                Get.to(() => ServiceRequestScreen());
              },
            ),
            ActionButton(
              text: 'DOCUMENTS',
              color: highlightColor,
              onTap: () {
                Get.to(() => const DocumentsScreen());
              },
            ),
            const SizedBox(height: 30),
            const TitleWithBorder(title: 'CONCIERGE SERVICES'),
            ActionButton(
              text: 'CONCIERGE REQUEST',
              color: infoColor,
              onTap: () {
                Get.to(() => const ConciergeRequestScreen());
              },
            ),
            ActionButton(
              text: 'PRE-ARRIVAL NOTIFICATION',
              color: mutedText,
              onTap: () {
                Get.to(() => const PreArrivalNotification());
              },
            ),
            ActionButton(
              text: 'DEPARTURE NOTIFICATION & REFRESH',
              color: borderColor,
              onTap: () {
                Get.to(() => const DepartureNofitication());
              },
            ),
            const SizedBox(height: 30),
            const TitleWithBorder(title: 'HOME IMPROVEMENT SERVICES'),
            ActionButton(
              text: 'HOME IMPROVEMENT SERVICES',
              color: successColor,
              onTap: () {
                Get.to(() => const HomeImprovementServicesScreen());
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(Get.width, 50),
              ),
              child: Text(
                'CONTACT US',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: secondary,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ).paddingSymmetric(horizontal: 24),
    );
  }
}
