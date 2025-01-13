import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/screen/documents/cr/open.dart';
import 'package:lotuspmc/screen/documents/sr/complete.dart';
import 'package:lotuspmc/screen/documents/sr/denied.dart';
import 'package:lotuspmc/screen/documents/walk_thru_reposts.dart';
import 'package:lotuspmc/service/style/color.dart';
import 'documents/cr/complete.dart';
import 'documents/cr/denied.dart';
import 'documents/hi/complete.dart';
import 'documents/hi/open.dart';
import 'documents/sr/open.dart';
import 'widget/appbar.dart';
import 'widget/button.dart';
import 'widget/text.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar(
        title: "\nDOCUMENTS",
        backgroundColor: highlightColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWithBorder(title: 'PROPERTY MANAGEMENT')
                .paddingSymmetric(vertical: 10),
            ActionButton(
              text: 'WALK-THRU REPORTS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const WalkThruReposts());
              },
            ),
            ActionButton(
              text: 'OPEN ITEMS',
              color: lightBackground,
              onTap: () {
                // Get.to(() => const DocumentsScreen());
              },
            ),
            ActionButton(
              text: 'COMPLETED ITEMS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const DocumentsScreen());
              },
            ),
            ActionButton(
              text: 'CLIENT DENIED',
              color: lightBackground,
              onTap: () {
                // Get.to(() => const DocumentsScreen());
              },
            ),
            const TitleWithBorder(title: 'SERVICE REQUEST STATUS')
                .paddingSymmetric(vertical: 10),
            ActionButton(
              text: 'OPEN REQUESTS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const SROpenRequestScreen());
              },
            ),
            ActionButton(
              text: 'COMPLETED REQUESTS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const SRCompletedRequestScreen());
              },
            ),
            ActionButton(
              text: 'CLIENT DENIED',
              color: lightBackground,
              onTap: () {
                Get.to(() => const SRDeniedRequestScreen());
              },
            ),
            const TitleWithBorder(title: 'CONCIERGE REQUEST STATUS')
                .paddingSymmetric(vertical: 10),
            ActionButton(
              text: 'OPEN REQUESTS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const CROpenRequestScreen());
              },
            ),
            ActionButton(
              text: 'COMPLETED REQUESTS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const CRCompletedRequestScreen());
              },
            ),
            ActionButton(
              text: 'CLIENT DENIED',
              color: lightBackground,
              onTap: () {
                Get.to(() => const CRDeniedRequestScreen());
              },
            ),
            const TitleWithBorder(title: 'PROPERTY IMPROVEMENTS')
                .paddingSymmetric(vertical: 10),
            ActionButton(
              text: 'OPEN PROJECTS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const HIOpenRequestScreen());
              },
            ),
            ActionButton(
              text: 'COMPLETED PROJECTS',
              color: lightBackground,
              onTap: () {
                Get.to(() => const HiCompleteProjectScreen());
              },
            ),
            const SizedBox(height: 40),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
