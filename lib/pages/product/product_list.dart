import 'package:async_provider/constants/apis.dart';
import 'package:async_provider/pages/product/widgets/drawer_widget.dart';
import 'package:async_provider/provider/product/product_provider.dart';
import 'package:async_provider/provider/user_state_provider.dart';
import 'package:async_provider/routes/route_enum.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final producState = ref.watch(getProductsProvider);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: Center(child: Text('ProductPage'),),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(AppRoute.cart.name);
          }, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      drawer: DrawerWidget(),
      body:producState.when(
        skipLoadingOnRefresh: false,
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
                  itemBuilder: (context, index){
                    final product = data[index];
                    print(product.image);
                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(Duration(seconds: 1));
                        ref.invalidate(getProductsProvider);
                      },
                      child: InkWell(
                        onTap: (){
                          context.pushNamed(AppRoute.productDetail.name, extra: product.id);
                        },
                        child: GridTile(
                          footer: Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 60,
                            color: Colors.black.withOpacity(0.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Text(product.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),)),
                                Expanded(child: Text(
                                  maxLines: 1,
                                  'Price:${product.price}',style: TextStyle(color: Colors.white),)),
                              ],
                            ),
                          ),
                          child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          errorWidget: (c,s,d) => Image.asset('assets/images/dummy.jpg'),
                          imageUrl: '$base/${product.image}'),

                        ),
                      ),
                    );
                  }),
            );
          },
          error: (err, st)=>Center(child: Text('$err'),),
          loading: () => Center(child: CircularProgressIndicator())),

      );

  }
}