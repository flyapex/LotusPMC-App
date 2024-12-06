import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/service/style/color.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';

class WalkThruReposts extends StatelessWidget {
  const WalkThruReposts({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dates = List.generate(
      25,
      (index) => "OCT 31, 2024 12:00PM",
    );

    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nWALK-THRU REPORTS",
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(dates[index]),
                  onTap: () {
                    print('Selected: ${dates[index]}');
                  },
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
