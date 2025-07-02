import 'package:async_provider/provider/user_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('ProductPage'),),),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                ref.read(userStateProvider.notifier).logOutUser();
              },
              title: Text('Sign Out'),)
          ],
        ),
      ),
      body: ListView(
        children: [


        ],
      ),
    );
  }
}