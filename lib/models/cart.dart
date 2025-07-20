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



  Cart({required this.qty, required this.title, required this.image, required this.price});
}

// 1. Create a Hive box
// 2. Create a Hive object
// 3. Create a Hive field
// 4
