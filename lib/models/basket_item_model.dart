import 'package:hive/hive.dart';
import 'package:third_exam_n8/models/product_model.dart';

part 'basket_item_model.g.dart';

@HiveType(typeId: 2)
class BasketItem extends HiveObject {
  @HiveField(0)
  ProductModel product;

  @HiveField(1)
  int count;

  BasketItem({
    required this.product,
    required this.count,
  });
}
