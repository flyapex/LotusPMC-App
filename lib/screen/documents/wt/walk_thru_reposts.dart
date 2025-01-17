import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/wt_controller.dart';
import 'package:lotuspmc/service/style/color.dart';
import '../../widget/appbar.dart';
import '../../widget/button.dart';

class WalkThruReposts extends StatelessWidget {
  const WalkThruReposts({super.key});

  @override
  Widget build(BuildContext context) {
    WTController wtController = Get.find();
    wtController.fetchWtAll();
    return Scaffold(
      appBar: MyappBar(
        title: "\nWALK-THRU REPORTS",
        backgroundColor: highlightColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActionButton(
              text: 'All Reports',
              color: lightBackground,
              onTap: () {},
            ).paddingSymmetric(vertical: 20),
            Text(
              'SELECT A DATE BELOW TO REVIEW THE \nCORRESPONDING REPORTS',
              style: TextStyle(color: secondary),
            ).paddingOnly(bottom: 16),
            Obx(() {
              if (wtController.isLoadingAll.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: wtController.wtAllData.value!.data!.reports!.length,
                itemBuilder: (context, index) {
                  final dates = wtController.wtAllData.value!.data!.reports!;
                  return ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(
                      dates[index].createdAt.toString().substring(0, 11),
                    ),
                    onTap: () {
                      print('Selected: ${dates[index]}');
                      wtController.fetchPDF(
                        dates[index].id,
                      );
                    },
                  );
                },
              );
            }),
            const SizedBox(height: 40),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
