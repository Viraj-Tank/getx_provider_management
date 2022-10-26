import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_provider_management/controller/getx_controller.dart';
import 'package:getx_provider_management/screens/getx_detail_page.dart';

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
          // child: getBuilderWidget(),
          child: getObxWidget(controller),
        ));
  }

  Widget getObxWidget(MainController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text('This is Value: ${controller.count.value}')),
        ElevatedButton(
          onPressed: controller.increaseValue,
          child: const Text('Increase Value'),
        ),
         ElevatedButton(
          onPressed: () => Get.to(() => const GetXDetailPage(),transition: Transition.downToUp,duration: const Duration(seconds: 2)),
          child: const Text('Change Screen'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.changeTheme(ThemeData.light());
          },
          child: const Text('Change Theme'),
        ),

        /// there are also some components like snackBar(), defaultDialog()
        /// Get.snackbar('Snackbar Title', 'Snackbar text')
        /// Get.defaultDialog();
      ],
    );
  }

  Widget? getBuilderWidget() {
    GetBuilder<MainController>(builder: (controller) {
      return Column(
        children: [
          Text('This is Value: ${controller.countForBuilder}'),
          ElevatedButton(
            onPressed: controller.increaseValueWithBuilderPattern,
            child: const Text('Increase Value'),
          ),
          ElevatedButton(
            onPressed: () => Get.to(() => const GetXDetailPage()),
            child: const Text('Change Screen'),
          ),
          ElevatedButton(
            onPressed: (){
              Get.changeTheme(ThemeData.dark());
            },
            child: const Text('Change Theme'),
          ),
        ],
      );
    });
  }
}
