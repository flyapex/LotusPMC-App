import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/cr_controller.dart';
import 'package:lotuspmc/screen/widget/appbar.dart';
import 'package:lotuspmc/service/style/color.dart';

class CRDeniedRequestScreen extends StatelessWidget {
  const CRDeniedRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CRController crController = Get.put(CRController());
    crController.fetchCRDenied();

    return Scaffold(
      appBar: MyappBar(
        title: "\nDENIED ITEMS",
        backgroundColor: highlightColor,
      ),
      body: Obx(() => crController.isLoadingDenied.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  // Submission Date	CR Description	Denial Date	Reason for Denial
                  DataColumn(label: Text('Submission Date')),
                  DataColumn(label: Text('CR Description')),
                  DataColumn(label: Text('Denial Date')),
                  DataColumn(label: Text('Reason for Denial')),
                ],
                rows: crController.crDeniedData.value!.data!.crInfos!
                    .map(
                      (info) => DataRow(cells: [
                        DataCell(
                            Text(info.submitDate.toString().substring(0, 11))),
                        DataCell(Text(info.description ?? 'N/A')),
                        DataCell(Text(info.denialDate.toString())),
                        DataCell(Text(info.reasonForDenial ?? 'N/A')),
                      ]),
                    )
                    .toList(),
              ),
            )),
    );
  }
}
