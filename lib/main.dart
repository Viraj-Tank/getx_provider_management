import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_provider_management/provider/list_provider.dart';
import 'package:getx_provider_management/screens/getx_detail_page.dart';
import 'package:getx_provider_management/screens/getx_management.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ListProvider(),
      child: const MyApp(),
    ),
    // MultiProvider(providers: [
    // ChangeNotifierProvider(
    //   create: (_) => ListProvider(),
    // )
    // ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/getdetail', page: () => const GetXDetailPage()),
      ],
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ProviderManagement(),
      home: const GetXManagement(),
    );
  }
}
