import 'package:hive_flutter/hive_flutter.dart';
part 'cart.g.dart';




@HiveType(typeId: 0)
class Cart extends HiveObject {

  @HiveField(0)
   int qty;

  @HiveField(1)
   String title;

  @HiveField(2)
   String image;

  @HiveField(3)
   int price;

  @HiveField(4)
  String id;



  Cart({required this.qty, required this.title, required this.image, required this.price, required this.id});

factory Cart.empty(){
  return Cart(qty: 0, title: '', image: '', price: 0, id: 'no-id');
}

Cart copyWith (int qt){
  return Cart(qty: qt, title: title, image: image, price: price, id: id);
}

}

// 1. Create a Hive box
// 2. Create a Hive object
// 3. Create a Hive field
// 4
