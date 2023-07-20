import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:third_exam_n8/models/basket_item_model.dart';
import 'package:third_exam_n8/models/product_model.dart';
import 'package:third_exam_n8/repository/favourite_repository.dart';
import 'package:third_exam_n8/utils/boxes.dart';
import 'package:third_exam_n8/utils/colors.dart';
import 'package:third_exam_n8/utils/images.dart';
import 'package:third_exam_n8/utils/style.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late List<ProductModel> products;
  @override
  void initState() {
    products = RepositoryFavourites.getAll;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites '),
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            ProductModel product = products[index];
            return Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      fit: BoxFit.scaleDown,
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        product.name,
                        style: AppStyle.body2.copyWith(
                            color: AppColors.c606060,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$ ${product.price}",
                        style: AppStyle.subhead.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.c303030),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            RepositoryFavourites.deleteById(product);
                            products = RepositoryFavourites.getAll;
                            setState(() {});
                          },
                          child: SvgPicture.asset(AppImages.clear)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(7),
                          child: SvgPicture.asset(AppImages.shoppingBag),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.cE0E0E0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: products.length),
    );
  }
}
