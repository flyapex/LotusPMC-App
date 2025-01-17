import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PANController extends GetxController {
  var selectedDateTime = DateTime.now().obs;

  String outdoorLightsController = '';
  String indoorLightsController = '';
  TextEditingController temperatureController = TextEditingController();
  TextEditingController poolTemperatureController = TextEditingController();
  String windowBlindsController = '';
  TextEditingController musicController = TextEditingController();
  TextEditingController flowerTypeController = TextEditingController();
  TextEditingController flowerLocationController = TextEditingController();
  TextEditingController groceriesController = TextEditingController();
  TextEditingController alcoholController = TextEditingController();
  TextEditingController housekeepingController = TextEditingController();
  TextEditingController trnsportationController = TextEditingController();
  TextEditingController automobileController = TextEditingController();
  TextEditingController specialRequestsController = TextEditingController();
}
