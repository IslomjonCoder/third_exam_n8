import 'package:flutter/material.dart';
import 'package:third_exam_n8/utils/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        currentIndex: selected,
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              selected == 0 ? AppImages.homeOn : AppImages.homeOff,
            ),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              selected == 1 ? AppImages.categoryOn : AppImages.categoryOff,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              selected == 2 ? AppImages.favouriteOn : AppImages.favouriteOff,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              selected == 3 ? AppImages.bagOn : AppImages.bagOff,
            ),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}
