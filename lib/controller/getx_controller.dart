import 'dart:ffi';

import 'package:get/get.dart';

class MainController extends GetxController {

  /// whenever we write .obs it works as a Listener
  /// on the receiver side where you use this count variable you need to wrap it with Obx Widget
  var count = 0.obs;

  increaseValue(){
    count++;
  }


  var countForBuilder = 0;
  increaseValueWithBuilderPattern() {
    count++;
    refresh();
  }

}