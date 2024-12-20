import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/db_controller.dart';
import 'package:lotuspmc/controller/user_controller.dart';
import 'package:lotuspmc/model/auth_model.dart';
import 'package:lotuspmc/screen/home.dart';
import '../service/style/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final UserController userController = Get.find();
  DBController dbController = Get.find();

  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != userController.passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: secondary),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 2),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      maxLines: maxLines,
    ).paddingSymmetric(vertical: 10);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = Get.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: secondary),
        centerTitle: true,
        title: Text(
          'CREATE ACCOUNT',
          style: TextStyle(
            fontSize: 18,
            color: primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   'CREATE ACCOUNT',
                //   style: TextStyle(
                //     fontSize: 18,
                //     color: primary,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 2,
                //   ),
                // ),
                // const SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  'LOTUS',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: secondary,
                  ),
                ),
                Text(
                  'PROPERTY MANAGEMENT',
                  style: TextStyle(
                    fontSize: 14,
                    color: secondary,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                  label: 'YOUR FIRST NAME',
                  controller: userController.firstNameController,
                  validator: _validateName,
                  keyboardType: TextInputType.name,
                ),
                buildTextField(
                  label: 'YOUR LAST NAME',
                  controller: userController.lastNameController,
                  validator: _validateName,
                  keyboardType: TextInputType.name,
                ),
                buildTextField(
                  label: 'EMAIL',
                  controller: userController.emailController,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                buildTextField(
                  label: 'ADDRESS',
                  controller: userController.addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.streetAddress,
                ),
                buildTextField(
                  label: 'CITY',
                  controller: userController.cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.streetAddress,
                ),
                buildTextField(
                  label: 'PHONE NUMBER',
                  controller: userController.phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                buildTextField(
                  label: 'PASSWORD',
                  controller: userController.passwordController,
                  obscureText: !_isPasswordVisible,
                  validator: _validatePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: primary,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                buildTextField(
                  label: 'CONFIRM PASSWORD',
                  controller: userController.confirmPasswordController,
                  obscureText: !_isPasswordVisible,
                  validator: _validateConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: primary,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                buildTextField(
                  label: 'NOTE',
                  controller: userController.noteController,
                  validator: (value) {
                    if (value != null && value.length > 200) {
                      return 'Note cannot exceed 200 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      LoginResponseModel? response =
                          await userController.manualRegister();
                      if (response != null) {
                        dbController.saveUserToken(response.data.token);
                        dbController.saveUserId(response.data.id);

                        Get.offAll(() => const HomeScreen());
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(screenWidth, 50),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ).paddingSymmetric(horizontal: 24),
          ),
        ),
      ),
    );
  }
}
