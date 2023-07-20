import 'package:flutter/material.dart';

import 'package:third_exam_n8/utils/path.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key? key, required this.product, required this.isInCard})
      : super(key: key);
  ProductModel product;
  bool isInCard;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isInCard ? Colors.orange : Colors.blue,
        ),
        onPressed: () {
          setState(() {
            if (widget.isInCard == false) {
              RepositoryBasket.insertProduct(widget.product);
              widget.isInCard = !widget.isInCard;
            }
          });
        },
        child: const Text('Add to cart 🛒'),
      ),
    );
  }
}
