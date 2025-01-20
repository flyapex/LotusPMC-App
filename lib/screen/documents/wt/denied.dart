import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/wt_controller.dart';
import 'package:lotuspmc/screen/widget/appbar.dart';
import 'package:lotuspmc/service/common.dart';
import 'package:lotuspmc/service/style/color.dart';

class WTDeniedRequestScreen extends StatelessWidget {
  const WTDeniedRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WTController wtController = Get.put(WTController());
    wtController.fetchWTDenied();

    return Scaffold(
      appBar: MyappBar(
        title: "\nDENIED ITEMS",
        backgroundColor: highlightColor,
      ),
      body: Obx(() {
        //'No Data Found',
        if (wtController.wtDeniedData.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (wtController.wtDeniedData.value!.data!.reports!.isEmpty) {
          return const Center(child: Text('No Data Found'));
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              //Inspection Date	Denial Date	Approval Status	Reason for denial
              DataColumn(label: Text('Inspection Date')),
              DataColumn(label: Text('Denial Date')),
              DataColumn(label: Text('Approval Status')),
              DataColumn(label: Text('Reason for denial')),
            ],
            rows: wtController.wtDeniedData.value!.data!.reports!
                .map(
                  (info) => DataRow(cells: [
                    DataCell(Text(formatDateTime(info.createdAt))),
                    DataCell(Text(formatDateTime(info.denialDate))),
                    DataCell(Text(info.clientApprovedRepair ?? 'N/A')),
                    DataCell(Text(info.reasonForDenial ?? 'N/A')),
                  ]),
                )
                .toList(),
          ),
        );
      }),
    );
  }
}
