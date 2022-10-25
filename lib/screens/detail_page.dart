import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/list_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favouritesList = context.watch<ListProvider>().itemsList;
    var provider = Provider.of<ListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List items detail'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('List Item ${favouritesList[index]}'),
            trailing: TextButton(
              onPressed: () {
                provider.removeItem(favouritesList[index]);
              },
              child: const Text('Remove'),
            ),
          );
        },
        itemCount: favouritesList.length,
      ),
    );
  }
}
