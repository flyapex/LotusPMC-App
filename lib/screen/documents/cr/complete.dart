import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/cr_controller.dart';
import 'package:lotuspmc/screen/widget/appbar.dart';
import 'package:lotuspmc/service/style/color.dart';

class CRCompletedRequestScreen extends StatelessWidget {
  const CRCompletedRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CRController crController = Get.put(CRController());
    crController.fetchCRCompleted();

    return Scaffold(
      appBar: MyappBar(
        title: "\nCOMPLETED ITEMS",
        backgroundColor: highlightColor,
      ),
      body: Obx(() => crController.isLoadingCompleted.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  //  Submission Date	CR Description	Completed Date	Cost of Correction
                  DataColumn(label: Text('Submission Date')),
                  DataColumn(label: Text('CR Description')),
                  DataColumn(label: Text('Client Approved Repair')),
                  DataColumn(label: Text('Cost of Correction')),
                ],
                rows: crController.crCompletedData.value!.data!.crInfos!
                    .map(
                      (info) => DataRow(cells: [
                        DataCell(
                            Text(info.submitDate.toString().substring(0, 11))),
                        DataCell(Text(info.description ?? 'N/A')),
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
