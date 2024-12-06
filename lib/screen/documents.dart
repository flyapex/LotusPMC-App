import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/screen/documents/walk_thru_reposts.dart';
import 'package:lotuspmc/service/style/color.dart';

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
        title: "MR & MRS COLAMARINO'S\nDOCUMENTS",
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
                // Get.to(() => const DocumentsScreen());
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
                // Get.to(() => const DocumentsScreen());
              },
            ),
            ActionButton(
              text: 'COMPLETED REQUESTS',
              color: lightBackground,
              onTap: () {
                // Get.to(() => const DocumentsScreen());
              },
            ),
            ActionButton(
              text: 'CLIENT DENIED',
              color: lightBackground,
              onTap: () {
                // Get.to(() => const DocumentsScreen());
              },
            ),
            const TitleWithBorder(title: 'PROPERTY IMPROVEMENTS')
                .paddingSymmetric(vertical: 10),
            ActionButton(
              text: 'OPEN PROJECTS',
              color: lightBackground,
              onTap: () {
                // Get.to(() => const DocumentsScreen());
              },
            ),
            ActionButton(
                text: 'COMPLETED PROJECTS',
                color: lightBackground,
                onTap: () {}),
            const SizedBox(height: 40),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
