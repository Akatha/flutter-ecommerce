import 'package:async_provider/provider/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmount = ref.watch(cartListProvider.notifier).totalAmount;
    final carts = ref.watch(cartListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart-Detail')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: carts.isEmpty ? Center(child: Text('Cart is empty'),) :Stack(

          children: [
            ListView.builder(
              itemCount: carts.length,
              itemBuilder: (c, index) {
                return ListTile(
                  title: Text(carts[index].title),
                  subtitle: Text('Price: ${carts[index].price}'),
                  trailing: SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){
                          ref.read(cartListProvider.notifier).singleRemove( carts[index]);
                        }, icon: Icon(Icons.remove)),
                        Text('${carts[index].qty}', style: TextStyle(fontSize: 16),),
                        IconButton(onPressed: (){
                          ref.read(cartListProvider.notifier).singleAdd(carts[index]);
                        }, icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                );
              }


        ),
            Positioned(
              bottom:  10,
                child: Column(
                  children: [

                    Row(
                      children: [
                        Text('Total Amount: $totalAmount'),
                      ],
                    ),
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          minimumSize: Size(360, 40)
                        ),
                        onPressed: (){}, child: Text('Checkout')),
                  ],
                ))
            ]
            ),
      ),
    );
  }
}