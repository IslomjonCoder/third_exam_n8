import 'package:hive/hive.dart';
import 'package:third_exam_n8/utils/path.dart';

class RepositoryFavourites {
  static final Box _box = Hive.box(BoxNames.favourites);

  static List<ProductModel> get getAll =>
      _box.values.map((e) => e as ProductModel).toList();

  static Future<void> deleteById(ProductModel product) async {
    _box.delete(product.id);
  }

  static Future<void> insertProduct(ProductModel product) async {
    _box.put(product.id, product);
  }
}
