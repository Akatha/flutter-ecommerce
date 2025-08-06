import 'package:async_provider/constants/apis.dart';
import 'package:async_provider/models/cart_item.dart';


import 'package:async_provider/provider/product/product_provider.dart';
import 'package:async_provider/routes/route_enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';


import '../../provider/cart/cart_provider.dart';







class ProductDetail extends ConsumerWidget {
  final String id;
  const ProductDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final cart = ref.watch(cartListProvider);
    final state = ref.watch(getProductProvider(id: id));
    return Scaffold(
      appBar: AppBar(),
      body: state.when(
          data: (data){
           return SingleChildScrollView(
             child: Column(
               children: [
                 CachedNetworkImage(imageUrl: '$base/${data.image}',
                 placeholder: (context, url) => const CircularProgressIndicator(),
                 errorWidget: (context, url, error) => const Icon(Icons.error),),
                 Text(data.title),
                 Text(data.price.toString()),
                 Text(data.description),
                 Text(data.category),
                 const SizedBox(height: 20,),
                 ElevatedButton(onPressed: (){
                   // Hive.box<Cart>('carts').clear();
                   //  print(cart[0].qty);

                    ref.read(cartListProvider.notifier).setCart(data);
                    context.pushNamed(AppRoute.cart.name);
                 }, child: Text('Add To cart')),
               ],
             ),
           );

          },
          error: (state, err){
             return Text('$err');
          },
          loading: ()=> Center(child: CircularProgressIndicator())
      ),
    );
  }
}