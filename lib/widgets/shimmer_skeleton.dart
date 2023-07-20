import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  Skeleton({Key? key, this.width = 0, this.height = 0}) : super(key: key);

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
    );
  }
}
