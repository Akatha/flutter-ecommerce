import 'package:async_provider/provider/product/product_provider.dart';
import 'package:async_provider/routes/route_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdminProducts extends ConsumerWidget {
  const AdminProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(getProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductList'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
            child: TextButton(onPressed: (){
              context.pushNamed(AppRoute.productAdd.name);
            }, child: Text('Add Product'))),
            SizedBox(
              height: 10,
            ),
            Expanded(child: productState.when(
                data: (data){

                  return ListView.separated(
                      itemBuilder: (context, index){
                        final product = data[index];
                        return ListTile(
                          contentPadding: EdgeInsets.only(left: 10),
                          title: Text(product.title),
                          subtitle: Text('Rs.${product.price}'),
                          trailing: SizedBox(
                            width:100,
                            child: Row(
                              children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                              IconButton(onPressed: (){
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text('Are you sure?'),
                                    content: Text('you want to delete this product'),
                                    actions: [
                                      TextButton(onPressed: (){
                                        context.pop();
                                      }, child: Text('Cancel')),
                                      TextButton(onPressed: (){
                                        context.pop();
                                      }, child: Text('Delete'))
                                    ],
                                  );
                                });
                              }, icon: Icon(Icons.delete))
                              ],
                            ),
                          )
                        );
                      },
                      separatorBuilder: (c, i)=> Divider(),
                      itemCount: data.length);
                },
                error: (err ,st){
                  return Center(child: Text('$err'));
                },
                loading: ()=> Center(child: CircularProgressIndicator())
            )
            )
          ],
        ),
      ),
    );
  }
}