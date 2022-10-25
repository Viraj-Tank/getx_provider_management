import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_provider_management/controller/getx_controller.dart';

class GetXManagement extends StatelessWidget {
  const GetXManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
      ),
      body: Center(
        // child:getBuilderWidget(),
        child:getObxWidget(controller),
      ),
    );
  }

  Widget getObxWidget(MainController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text('This is Value: ${controller.count.value}')),
        ElevatedButton(
          onPressed: controller.increaseValue,
          child: const Text('Increase Value'),
        )
      ],
    );
  }


  Widget? getBuilderWidget() {
    GetBuilder<MainController>(builder: (controller) {
      return Column(
        children: [
          Text('This is Value: ${controller.count}'),
          ElevatedButton(
            onPressed: controller.increaseValue,
            child: const Text('Increase Value'),
          )
        ],
      );
    });
  }

}
