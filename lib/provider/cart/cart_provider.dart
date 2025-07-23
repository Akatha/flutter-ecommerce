import 'package:async_provider/main.dart';
import 'package:async_provider/models/cart.dart';
import 'package:async_provider/models/product.dart' show Product;
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_provider.g.dart';

@riverpod
class CartList extends _$CartList {
  @override
  List<Cart> build() {
    return ref.watch(cartsProvider) ;
  }

  void setCart(Product product){
  final isExist = state.firstWhere((cart)=> cart.id == product.id, orElse: ()=> Cart.empty());
  if(isExist.id =='no-id'){
    final newCart = Cart(qty: 1, title: product.title, image: product.image, price: product.price, id: product.id);
    state = [...state, newCart ];
    Hive.box<Cart>('carts').add(newCart);
  }else{

    state = [
      for (final cart in state) cart.id == isExist.id ? isExist.copyWith(isExist.qty +1 ): cart
    ];
    isExist.qty = isExist.qty + 1;
    isExist.save();

  }
  }
}
