import 'package:flutter/material.dart';
import 'package:third_exam_n8/ui/categories_screen.dart';
import 'package:third_exam_n8/ui/favourites_screen.dart';
import 'package:third_exam_n8/ui/products_screen.dart';
import 'package:third_exam_n8/ui/shopping_card_screen.dart';

const String baseUrl = 'https://imtixon.free.mockoapp.net/';
List<Widget> pages = [
  ProductsScreen(),
  CategoriesScreen(),
  FavouritesScreen(),
  ShoppingCardScreen()
];
