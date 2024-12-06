import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/service/style/color.dart';

import 'widget/appbar.dart';
import 'widget/cart.dart';
import 'widget/text.dart';

class PropertyInformationScreen extends StatelessWidget {
  const PropertyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nPROPERTY INFORMATION",
        backgroundColor: lightBackground, //change it
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleWithBorder(title: 'HOME OVERVIEW'),
            const SubTitleWithBorder(
              title: 'ADDRESS:',
              subtitle:
                  'MR & MRS COLAMARINO’S 310 NW 7TH STREET DELRAY BEACH, FL 33444',
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'SIZE OF HOME:',
                    subtitle: '3,500 SQ FEET',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'YEAR BUILT:',
                    subtitle: '2019',
                  ),
                ),
              ],
            ),
            const SubTitleWithBorder(
              title: 'NUMBER OF STORIES:',
              subtitle: '1',
            ),
            const SubTitleWithBorder(
              title: 'CONSTRUCTION TYPE:',
              subtitle: 'WOOD FRAME',
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'IMPACT WINDOWS:',
                    subtitle: 'YES',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'NUMBER OF STORIES:',
                    subtitle: '1',
                  ),
                ),
              ],
            ),

            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'POOL:',
                    subtitle: 'YES, SALT WATER',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'HOA:',
                    subtitle: 'YES',
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'GATED COMMUNITY:',
                    subtitle: 'YES',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SubTitleWithBorder(
                    title: 'GATED PROPERTY:',
                    subtitle: 'NO',
                  ),
                ),
              ],
            ),

            const TitleWithBorder(title: 'CONTACT PREFERENCES'),

            const SubTitleWithBorder(
              title: 'NAME:',
              subtitle: 'NEAL JONES',
              padding: 10,
            ),
            const SubTitleWithBorder(
              title: 'EMAIL:',
              subtitle: 'NEAL.JONES@LONGESTEMAILADDRESSEVER.COM',
              padding: 5,
            ),
            const SubTitleWithBorder(
              title: 'CELL:',
              subtitle: '561-716-2331',
              padding: 5,
            ),
            const SubTitleWithBorder(
              title: 'CLIENT PREFERS TO BE CONTACTED VIA:',
              subtitle: 'CELL',
              padding: 5,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: lightBackground,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w100)),
              child: Text(
                'CONTACT US FOR UPDATES',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: secondary,
                ),
              ),
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
