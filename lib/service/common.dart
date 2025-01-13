import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
  );
} // Method to fetch property information

