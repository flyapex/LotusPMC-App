import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/api/api_auth.dart';
import 'package:lotuspmc/model/auth_model.dart';

class UserController extends GetxController {
  // Snackbar
  void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Future<LoginResponseModel?> manualLogin() async {
    try {
      LoginResponseModel? response = await ApiServiceLogin.manualLoginApi(
        LoginModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      if (response != null) {
        showSnackbar(
          'Success',
          response.message.toString(),
        );
        return response;
      } else {
        showSnackbar(
          'Error',
          "Email Address or Password is incorrect!",
        );
        return null;
      }
    } catch (e) {
      print('Error in manualLogin: $e');
      showSnackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
      );
      return null;
    }
  }

  Future<LoginResponseModel?> manualRegister() async {
    try {
      LoginResponseModel? response = await ApiServiceLogin.manualRegisterApi(
        RegisterModel(
          fName: firstNameController.text,
          lName: lastNameController.text,
          address: addressController.text,
          city: cityController.text,
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
          password: passwordController.text,
          cPassword: confirmPasswordController.text,
          note: noteController.text,
        ),
      );
      print(response);
      if (response != null) {
        showSnackbar(
          'Success',
          response.message.toString(),
        );
        return response;
      } else {
        showSnackbar(
          'Error',
          "The email or phone number has already been taken.",
        );
        return null;
      }
    } catch (e) {
      print('Error in manualLogin: $e');
      showSnackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
      );
      return null;
    }
  }
}
