import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_provider_management/controller/getx_controller.dart';

class GetXDetailPage extends StatelessWidget {
  const GetXDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// when you already have initialized controller in previous you can get that same controller using find() method in GetX
    var controller = Get.find<MainController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('value : ${controller.count.value}')),
            ElevatedButton(
              onPressed: controller.decreaseValue,
              child: const Text('Decrease Value'),
            ),
          ],
        ),
      ),
    );
  }
}
