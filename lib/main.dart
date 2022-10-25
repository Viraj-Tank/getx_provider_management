import 'package:flutter/material.dart';
import 'package:getx_provider_management/provider/ListProvider.dart';
import 'package:getx_provider_management/screens/detail_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      // ChangeNotifierProvider(
      //   create: (_) => ListProvider(),
      //   child: const MyApp(),
      // ),
      MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ListProvider(),
    )
  ], child: const MyApp()));
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
    var favouritesList = context.watch<ListProvider>().itemsList;
    var provider = Provider.of<ListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items ${favouritesList.length}'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('List Item $index'),
            trailing: GestureDetector(
                onTap: () {
                  if (!favouritesList.contains(index)) {
                    provider.addItem(index);
                  } else {
                    provider.removeItem(index);
                  }
                },
                child: Icon(
                  Icons.favorite,
                  color: favouritesList.contains(index) ? Colors.red : Colors.grey,
                )),
          );
        },
        itemCount: 21,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) {
              return const DetailPage();
            },
          ));
        },
      ),
    );
  }
}
