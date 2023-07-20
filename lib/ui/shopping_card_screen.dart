import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:third_exam_n8/utils/path.dart';

class ShoppingCardScreen extends StatefulWidget {
  const ShoppingCardScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCardScreen> createState() => _ShoppingCardScreenState();
}

class _ShoppingCardScreenState extends State<ShoppingCardScreen> {
  List<BasketItem> basketItems = RepositoryBasket.getAll();

  int summa = 0;

  void calculateSumma() {
    summa = 0;
    for (final element in basketItems) {
      summa += element.product.price * element.count;
    }
  }

  @override
  void initState() {
    calculateSumma();
    super.initState();
  }

  void loadData() {
    basketItems = [];
    calculateSumma();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping cart'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete all'),
                  content: const Text(
                    'Dou you want to delete all product from your cart',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        RepositoryBasket.deleteAll();
                        loadData();

                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                final BasketItem basketItem = basketItems[index];

                return SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: basketItem.product.imageUrl,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            basketItem.product.name,
                            style: AppStyle.body2.copyWith(
                              color: AppColors.c606060,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$ ${basketItem.product.price}",
                            style: AppStyle.subhead.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.c303030,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (basketItem.count > 0) basketItem.count--;
                                  calculateSumma();
                                  basketItems = RepositoryBasket.getAll();
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.cE0E0E0,
                                  ),
                                  child: const Icon(CupertinoIcons.minus),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                basketItem.count.toString(),
                                style: AppStyle.body1.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c242424,
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  basketItem.count++;
                                  calculateSumma();
                                  basketItems = RepositoryBasket.getAll();
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.cE0E0E0,
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              RepositoryBasket.deleteById(basketItem);
                              basketItems = RepositoryBasket.getAll();
                              calculateSumma();
                              setState(() {});
                            },
                            child: SvgPicture.asset(AppImages.clear),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: basketItems.length,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
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
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
