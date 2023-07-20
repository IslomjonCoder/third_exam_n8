import 'package:hive/hive.dart';

import 'package:third_exam_n8/utils/path.dart';

class RepositoryBasket {
  static final Box _box = Hive.box(BoxNames.basket);

  static List<BasketItem> getAll() {
    return _box.values.map((e) => e as BasketItem).toList();
  }

  static void deleteById(BasketItem item) {
    _box.delete(item.product.id);
  }

  static void deleteAll() {
    _box.clear();
  }

  static void editProduct(BasketItem item) {
    _box.put(
      item.product.id,
      BasketItem(product: item.product, count: item.count),
    );
  }

  static void insertProduct(ProductModel product) {
    _box.put(product.id, BasketItem(product: product, count: 1));
  }
}
