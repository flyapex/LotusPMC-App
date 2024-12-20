import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/property_controller.dart';
import 'package:lotuspmc/service/style/color.dart';
import 'widget/appbar.dart';
import 'widget/text.dart';

class PropertyInformationScreen extends StatelessWidget {
  const PropertyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyController propertyController = Get.find();
    propertyController.fetchPropertyInformation(43);

    return Scaffold(
      appBar: MyappBar(
        title: "MR & MRS COLAMARINO'S\nPROPERTY INFORMATION",
        backgroundColor: lightBackground,
      ),
      body: Obx(
        () {
          if (propertyController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          final property = propertyController.propertyInfo.value!.data;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithBorder(title: 'HOME OVERVIEW'),
                SubTitleWithBorder(
                  title: 'ADDRESS:',
                  subtitle: property.address,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'SIZE OF HOME:',
                        subtitle: property.sizeOfHome,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'YEAR BUILT:',
                        subtitle: property.yearBuilt,
                      ),
                    ),
                  ],
                ),
                SubTitleWithBorder(
                  title: 'NUMBER OF STORIES:',
                  subtitle: property.numberOfStories,
                ),
                SubTitleWithBorder(
                  title: 'CONSTRUCTION TYPE:',
                  subtitle: property.constructionType,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'IMPACT WINDOWS:',
                        subtitle: property.impactWindows,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'NUMBER OF STORIES:',
                        subtitle: property.numberOfStories,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'POOL:',
                        // property.constructionType,
                        subtitle: '${property.hasPool}, ${property.poolType}',
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'HOA:',
                        subtitle: property.hasHoa,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'GATED COMMUNITY:',
                        subtitle: property.gatedCommunity,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SubTitleWithBorder(
                        title: 'GATED PROPERTY:',
                        subtitle: property.gatedProperty,
                      ),
                    ),
                  ],
                ),

                const TitleWithBorder(title: 'CONTACT PREFERENCES'),

                SubTitleWithBorder(
                  title: 'NAME:',
                  subtitle: property.contactName,
                  padding: 10,
                ),
                SubTitleWithBorder(
                  title: 'EMAIL:',
                  subtitle: property.contactEmail,
                  padding: 5,
                ),
                SubTitleWithBorder(
                  title: 'CELL:',
                  subtitle: property.contactCell,
                  padding: 5,
                ),
                SubTitleWithBorder(
                  title: 'CLIENT PREFERS TO BE CONTACTED VIA:',
                  subtitle: property.preferredContactMethod,
                  padding: 5,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: lightBackground,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
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
                // const SizedBox(height: 10),
                // const TitleWithBorder(title: 'PROPERTY FLOORPLANS'),
                // Text(
                //   "CLICK ON A FLOORPLAN TO ENLARGE THE VIEW.",
                //   style: TextStyle(
                //     fontSize: 14,
                //     color: secondary.withOpacity(0.5),
                //   ),
                // ),
                const SizedBox(height: 20),
                // Floorplans
                // GridView.count(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 10,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   children: const [
                //     CartContainer(label: '1ST FLOOR'),
                //     CartContainer(label: '2ND FLOOR'),
                //     CartContainer(label: '3RD FLOOR'),
                //     CartContainer(label: 'BASEMENT'),
                //   ],
                // ),
                const SizedBox(height: 40),
              ],
            ).paddingSymmetric(horizontal: 24),
          );
        },
      ),
    );
  }
}
