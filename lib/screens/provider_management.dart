import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/list_provider.dart';
import 'detail_page.dart';

class ProviderManagement extends StatelessWidget {
  const ProviderManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favouritesList = context.watch<ListProvider>().itemsList;
    var provider = Provider.of<ListProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (ctx) {
              return const DetailPage();
            },
          ));
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (ctx) {
          //     return const DetailPage();
          //   },
          // ));
        },
      ),
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
    );
  }
}
