import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/service/style/color.dart';

import 'widget/appbar.dart';
import 'widget/input.dart';
import 'widget/text.dart';

class ConciergeRequestScreen extends StatefulWidget {
  const ConciergeRequestScreen({super.key});

  @override
  State<ConciergeRequestScreen> createState() => _ConciergeRequestScreenState();
}

class _ConciergeRequestScreenState extends State<ConciergeRequestScreen> {
  final TextEditingController detailsController = TextEditingController();

  final List<String> services = [
    'VEHICLE DETAILING',
    'TRANSPORTATION SERVICE',
    'FLORAL DELIVERY',
    'TRAVEL ARRANGEMENTS',
    'CULINARY SERVICES',
    'PRIVATE CHARTERS',
    'EVENT PLANNING',
    'IT SUPPORT',
    'CONCIERGE MEDICINE',
  ];

  final List<String> selectedServices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nCONCIERGE REQUEST",
        backgroundColor: infoColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PLEASE LET US KNOW YOUR NEEDS BELOW.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: secondary,
              ),
            ).paddingSymmetric(vertical: 20),
            const TitleWithBorder(title: 'SAMPLE SERVICES'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: services.map((service) {
                final isSelected = selectedServices.contains(service);
                return ChoiceChip(
                  label: Text(service),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      isSelected
                          ? selectedServices.remove(service)
                          : selectedServices.add(service);
                    });
                  },
                  selectedColor: primary,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : secondary,
                  ),

                  // shape: RoundedRectangleBorder(
                  //   side: const BorderSide(color: Colors.white),
                  //   borderRadius: BorderRadius.circular(8.0),
                  // ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              }).toList(),
            ),
            Text(
              'SPECIFIC REQUESTS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: secondary,
              ),
            ).paddingOnly(top: 20, bottom: 10),
            BigInputBox(
              controller: detailsController,
              onSubmit: () {
                if (detailsController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please fill out all required fields.')),
                  );
                  return;
                }

                print('Details: ${detailsController.text}');
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
