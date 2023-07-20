import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:third_exam_n8/models/basket_item_model.dart';
import 'package:third_exam_n8/models/product_model.dart';
import 'package:third_exam_n8/utils/boxes.dart';

class RepositoryFavourites {
  static Box box = Hive.box(BoxNames.favourites);

  static List<ProductModel> get getAll {
    return box.values.map((e) => e as ProductModel).toList();
  }

  static void deleteById(ProductModel product) {
    box.delete(product.id);
  }

  static void insertProduct(ProductModel product) {
    box.put(product.id, product);
  }
}

class RepositoryBasket {
  static Box box = Hive.box(BoxNames.basket);

  static List<BasketItem> get getAll {
    return box.values.map((e) => e as BasketItem).toList();
  }

  static void deleteById(BasketItem item) {
    box.delete(item.product.id);
  }

  static void editProduct(BasketItem item) {
    box.put(
        item.product.id, BasketItem(product: item.product, count: item.count));
  }

  static void insertProduct(ProductModel product) {
    box.put(product.id, BasketItem(product: product, count: 1));
  }
}
