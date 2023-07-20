import 'package:flutter/material.dart';
import 'package:third_exam_n8/models/category_model.dart';
import 'package:third_exam_n8/ui/categories_screen.dart';
import 'package:third_exam_n8/ui/category_products_screen.dart';
import 'package:third_exam_n8/ui/favourites_screen.dart';
import 'package:third_exam_n8/ui/products_screen.dart';
import 'package:third_exam_n8/ui/shopping_card_screen.dart';

class RouteNames {
  static const String categories = "/categories";
  static const String products = "/products";
  static const String favourites = "/favourites";
  static const String shoppingCard = "/shopping_card";
  static const String categoryProducts = "/category_products";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.categories:
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      case RouteNames.products:
        return MaterialPageRoute(builder: (context) => ProductsScreen());
      case RouteNames.categoryProducts:
        return MaterialPageRoute(
            builder: (context) => CategoryProductsScreen(
                  category: settings.arguments as CategoryModel,
                ));
      case RouteNames.favourites:
        return MaterialPageRoute(
            builder: (context) => const FavouritesScreen());
      case RouteNames.shoppingCard:
        return MaterialPageRoute(builder: (context) => ShoppingCardScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found"),
            ),
          ),
        );
    }
  }
}
