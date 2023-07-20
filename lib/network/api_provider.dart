import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:third_exam_n8/models/category_model.dart';
import 'package:third_exam_n8/models/product_model.dart';
import 'package:third_exam_n8/models/universal_model.dart';
import 'package:third_exam_n8/utils/constants.dart';

class ApiProvider {
  Future<UniversalModel> fetchProducts() async {
    String url = '$baseUrl/products';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalModel(
            data: (jsonDecode(response.body)['data'] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList(),
            statusCode: HttpStatus.ok);
      }
      return UniversalModel(
          error: "Status code not equal to 200",
          statusCode: response.statusCode);
    } on SocketException {
      return UniversalModel(error: "Internet Error!");
    } on FormatException {
      return UniversalModel(error: "Format Error!");
    } catch (e) {
      return UniversalModel(error: e.toString());
    }
  }

  Future<UniversalModel> fetchCategories() async {
    String url = '$baseUrl/categories';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        return UniversalModel(
            data: (jsonDecode(response.body) as List)
                .map((e) => CategoryModel.fromJson(e))
                .toList(),
            statusCode: HttpStatus.ok);
      }
      return UniversalModel(
          error: "Status code not equal to 200",
          statusCode: response.statusCode);
    } on SocketException {
      return UniversalModel(error: "Internet Error!");
    } on FormatException {
      return UniversalModel(error: "Format Error!");
    } catch (e) {
      return UniversalModel(error: e.toString());
    }
  }

  Future<UniversalModel> fetchCategoryProductsByID({required int id}) async {
    String url = '$baseUrl/categories/$id';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalModel(
            data: (jsonDecode(response.body) as List)
                .map((e) => ProductModel.fromJson(e))
                .toList(),
            statusCode: HttpStatus.ok);
      }
      return UniversalModel(
          error: "Status code not equal to 200",
          statusCode: response.statusCode);
    } on SocketException {
      return UniversalModel(error: "Internet Error!");
    } on FormatException {
      return UniversalModel(error: "Format Error!");
    } catch (e) {
      return UniversalModel(error: e.toString());
    }
  }
}
