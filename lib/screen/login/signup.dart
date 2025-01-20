import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotuspmc/controller/db_controller.dart';
import 'package:lotuspmc/controller/user_controller.dart';
import 'package:lotuspmc/model/common.dart';
import 'package:pick_country_picker/pick_country_picker.dart';
import '../../service/style/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final UserController userController = Get.find();
  DBController dbController = Get.find();

  Country? selectedCountry;
  List<Country> filteredCountries = [];

  @override
  void initState() {
    super.initState();
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.90,
        child: CountryPickerModal(
          hideCloseIcon: true,
          hideSearch: false,
          backButton: Container(),
          selectedCountryIsoCode: selectedCountry?.iso2Code,
          // excludedCountryCodes: excludedCountryCodes,
          title: 'Select a country',
          priorityCountryCodes: const ['US', 'CA', 'GB', 'LV'],
          onCountryChanged: (Country country) {
            setState(() => selectedCountry = country);
            Navigator.of(context).pop();
          },
          countryDisplayBuilder: (Country country) {
            return country.countryName;
          },
          subtitleBuilder: (Country country) {
            return '+${country.countryCode}';
          },
          flagBuilder: (Country country) {
            return Image.asset(
              country.flagUri!,
              package: 'pick_country_picker',
              width: 32,
              height: 20,
            );
          },
          borderBuilder: Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey[400]!,
              width: 0.5,
            )),
          ),
          useCupertinoModal: false, // Set to false to use Material design
        ),
      ),
    );
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
          'Let’s connect',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
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
                    ],
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
                  label: 'EMAIL *',
                  controller: userController.emailController,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                buildTextField(
                  label: 'Phone',
                  controller: userController.emailController,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const Text(
                  'ADDRESS',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _showCountryPicker,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(screenWidth, 50),
                  ),
                  child: selectedCountry == null
                      ? const Text(
                          'Select a Country',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      : Row(
                          children: [
                            Text(
                              selectedCountry!.countryName,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              selectedCountry!.flagUri!,
                              package: 'pick_country_picker',
                              width: 32,
                              height: 20,
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                  label: 'Address Line',
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
                  label: 'Address Line 2 *',
                  controller: userController.address1Controller,
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
                  label: 'STATE',
                  controller: userController.stateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                buildTextField(
                  label: 'ZIP CODE',
                  controller: userController.zipCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                buildTextField(
                  label: 'SIZE OF HOME',
                  controller: userController.sizeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                Text(
                  'Length of Term'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    Obx(
                      () => CheckboxListTile(
                        title: const Text('6 Months'),
                        value: userController.selectedLengthOfTerm.value ==
                            '6 months',
                        onChanged: (bool? value) {
                          if (value == true) {
                            userController.selectDuration('6 months');
                          }
                        },
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Obx(
                      () => CheckboxListTile(
                        title: const Text('1 Year'),
                        value: userController.selectedLengthOfTerm.value ==
                            '1 year',
                        onChanged: (bool? value) {
                          if (value == true) {
                            userController.selectDuration('1 year');
                          }
                        },
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                buildTextField(
                  label: 'MESSAGE *',
                  controller: userController.messageController,
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
                      ResponseModel? response =
                          await userController.manualRegister();
                      if (response != null) {}
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
