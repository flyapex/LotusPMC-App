import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/cr_controller.dart';
import 'package:lotuspmc/screen/widget/appbar.dart';
import 'package:lotuspmc/service/style/color.dart';

class CROpenRequestScreen extends StatelessWidget {
  const CROpenRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CRController crController = Get.find();
    crController.fetchCROpen();

    return Scaffold(
      appBar: MyappBar(
        title: "\nOPEN ITEMS",
        backgroundColor: highlightColor,
      ),
      body: Obx(() => crController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("Submission Date")),
                  DataColumn(label: Text("CR Description")),
                  DataColumn(label: Text("Approval Status")),
                  DataColumn(label: Text("Repair Date")),
                ],
                rows: crController.crOpenData.value!.data!.crInfos!
                    .map(
                      (info) => DataRow(cells: [
                        DataCell(
                            Text(info.submitDate.toString().substring(0, 11))),
                        DataCell(Text(info.description ?? 'N/A')),
                        DataCell(Text(info.clientApprovedRepair ?? 'N/A')),
                        DataCell(Text(info.completedDate ?? 'N/A')),
                      ]),
                    )
                    .toList(),
              ),
            )),
    );
  }
}
