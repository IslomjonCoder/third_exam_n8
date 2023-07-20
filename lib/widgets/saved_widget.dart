import 'package:flutter/material.dart';
import 'package:third_exam_n8/utils/path.dart';

class SavedIcon extends StatefulWidget {
  SavedIcon({Key? key, required this.product, required this.isSelected})
      : super(key: key);
  ProductModel product;
  bool isSelected = false;

  @override
  State<SavedIcon> createState() => _SavedIconState();
}

class _SavedIconState extends State<SavedIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {
          (!RepositoryFavourites.getAll
                  .map((e) => e.id)
                  .toList()
                  .contains(widget.product.id))
              ? RepositoryFavourites.insertProduct(widget.product)
              : RepositoryFavourites.deleteById(widget.product);
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
        },
        icon: Center(
          child: Icon(
            widget.isSelected ? Icons.favorite : Icons.favorite_border,
            color: widget.isSelected ? Colors.red : Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
