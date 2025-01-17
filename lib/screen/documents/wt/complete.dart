import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/wt_controller.dart';
import 'package:lotuspmc/screen/widget/appbar.dart';
import 'package:lotuspmc/service/style/color.dart';

class WTCompletedRequestScreen extends StatelessWidget {
  const WTCompletedRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WTController wtController = Get.put(WTController());
    wtController.fetchWTCompleted();

    return Scaffold(
      appBar: MyappBar(
        title: "\nCOMPLETED ITEMS",
        backgroundColor: highlightColor,
      ),
      body: Obx(() => wtController.isLoadingCompleted.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Inspection Date')),
                  DataColumn(label: Text('Completed Date')),
                  DataColumn(label: Text('Approval Status')),
                  DataColumn(label: Text('Cost of Correction')),
                ],
                rows: wtController.wtCompletedData.value!.data!.reports!
                    .map(
                      (info) => DataRow(cells: [
                        DataCell(Text(
                            info.completedDate.toString().substring(0, 11))),
                        DataCell(Text(
                            info.completedDate.toString().substring(0, 11))),
                        DataCell(Text(info.clientApprovedRepair ?? 'N/A')),
                        DataCell(Text(info.costOfCorrection ?? 'N/A')),
                      ]),
                    )
                    .toList(),
              ),
            )),
    );
  }
}
