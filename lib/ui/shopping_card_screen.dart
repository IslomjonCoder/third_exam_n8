import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:third_exam_n8/models/basket_item_model.dart';
import 'package:third_exam_n8/models/product_model.dart';
import 'package:third_exam_n8/repository/favourite_repository.dart';
import 'package:third_exam_n8/utils/colors.dart';
import 'package:third_exam_n8/utils/images.dart';
import 'package:third_exam_n8/utils/style.dart';

class ShoppingCardScreen extends StatefulWidget {
  ShoppingCardScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCardScreen> createState() => _ShoppingCardScreenState();
}

class _ShoppingCardScreenState extends State<ShoppingCardScreen> {
  List<BasketItem> basketItems = RepositoryBasket.getAll;

  int summa = 0;
  calculateSumma() {
    summa = 0;
    basketItems.forEach((element) {
      summa += element.product.price * element.count;
    });
  }

  @override
  void initState() {
    ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  BasketItem basketItem = basketItems[index];

                  return Container(
                    height: 100,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: CachedNetworkImage(
                            imageUrl: basketItem.product.imageUrl,
                            fit: BoxFit.scaleDown,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              basketItem.product.name,
                              style: AppStyle.body2.copyWith(
                                  color: AppColors.c606060,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "\$ ${basketItem.product.price}",
                              style: AppStyle.subhead.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.c303030),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (basketItem.count > 0)
                                      basketItem.count--;
                                    calculateSumma();
                                    basketItems = RepositoryBasket.getAll;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Icon(CupertinoIcons.minus),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.cE0E0E0),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  basketItem.count.toString(),
                                  style: AppStyle.body1.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.c242424),
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {
                                    basketItem.count++;
                                    calculateSumma();
                                    basketItems = RepositoryBasket.getAll;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Icon(Icons.add),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.cE0E0E0),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  RepositoryBasket.deleteById(basketItem);
                                  basketItems = RepositoryBasket.getAll;
                                  calculateSumma();
                                  setState(() {});
                                },
                                child: SvgPicture.asset(AppImages.clear)),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: basketItems.length),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: AppStyle.subhead
                      .copyWith(color: AppColors.c808080, fontSize: 18),
                ),
                Text(
                  '\$ $summa',
                  style: AppStyle.subhead.copyWith(
                      color: AppColors.c242424,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
          )
        ],
      ),
    );
  }
}
