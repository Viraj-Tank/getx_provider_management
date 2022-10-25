import 'package:flutter/material.dart';
import 'package:getx_provider_management/provider/list_provider.dart';
import 'package:getx_provider_management/screens/getx_management.dart';
import 'package:getx_provider_management/screens/provider_management.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('State management'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx) {
                      return const ProviderManagement();
                    },
                  ));
                },
                child: const Text('Provider')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx) {
                      return const GetXManagement();
                    },
                  ));
                },
                child: const Text('GetX')),
          ],
        ));
  }
}
