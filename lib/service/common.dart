import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
  );
} // Method to fetch property information

// String formatDate(String inputDate) {
//   try {
//     DateTime parsedDate = DateTime.parse(inputDate);

//     String formattedDate = DateFormat('MMMM d, yyyy').format(parsedDate);

//     return formattedDate;
//   } catch (e) {
//     return '';
//   }
// }

String formatDateTime(dateTime) {
  try {
    // return DateFormat('MMMM d, yyyy').format(dateTime!);
    DateTime parsedDate = DateTime.parse(dateTime.toString());

    String formattedDate = DateFormat('MMMM d, yyyy').format(parsedDate);

    return formattedDate;
  } catch (e) {
    return '';
  }
}
