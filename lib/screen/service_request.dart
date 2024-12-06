import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/screen/widget/input.dart';
import '../service/style/color.dart';
import 'widget/appbar.dart';
import 'widget/cart.dart';
import 'widget/text.dart';

class ServiceRequestScreen extends StatefulWidget {
  const ServiceRequestScreen({super.key});

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  String? requestType;
  final TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nSERVICE REQUEST",
        backgroundColor: accentBackground, //change it
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'PLEASE LET US KNOW YOUR SERVICE NEEDS BELOW.\n'
              'FOR INTERIOR REQUESTS, PLEASE ENTER THE ROOM NUMBER WITH YOUR REQUEST.\n\n'
              'PLEASE REFER TO YOUR FLOOR PLAN IN THE PROPERTY INFORMATION SECTION FOR ROOM NUMBERS.',
              style: TextStyle(
                color: secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            const TitleWithBorder(
              title: 'SUBMIT REQUEST',
            ),
            const Text(
              'IDENTIFY YOUR REQUEST TYPE',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text('INTERIOR RESIDENCE'),
                  value: 'Interior Residence',
                  groupValue: requestType,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      requestType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('EXTERIOR STRUCTURE'),
                  value: 'Exterior Structure',
                  groupValue: requestType,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      requestType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('EXTERIOR GROUNDS'),
                  value: 'Exterior Grounds',
                  groupValue: requestType,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      requestType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('HOUSEKEEPING'),
                  value: 'Housekeeping',
                  groupValue: requestType,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      requestType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('WATER FEATURES'),
                  value: 'Water Features',
                  groupValue: requestType,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      requestType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('STORM PREPAREDNESS'),
                  value: 'Storm Preparedness',
                  groupValue: requestType,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      requestType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('OTHER'),
                  value: 'Other',
                  groupValue: requestType,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      requestType = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            BigInputBox(
              controller: detailsController,
              onSubmit: () {
                if (requestType == null || detailsController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please fill out all required fields.')),
                  );
                  return;
                }

                print('Request Type: $requestType');
                print('Details: ${detailsController.text}');
              },
            ),
            const SizedBox(height: 10),
            const TitleWithBorder(title: 'PROPERTY FLOORPLANS'),
            Text(
              "CLICK ON A FLOORPLAN TO ENLARGE THE VIEW.",
              style: TextStyle(
                fontSize: 14,
                color: secondary.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 20),
            // Floorplans
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CartContainer(label: '1ST FLOOR'),
                CartContainer(label: '2ND FLOOR'),
                CartContainer(label: '3RD FLOOR'),
                CartContainer(label: 'BASEMENT'),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ).paddingSymmetric(horizontal: 24),
      ),
    );
  }
}
