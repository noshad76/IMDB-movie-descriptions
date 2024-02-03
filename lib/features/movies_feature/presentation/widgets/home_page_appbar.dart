import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      backgroundColor: Palete.darkblue,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu_rounded),
        color: Palete.white,
        iconSize: 35,
      ),
      actions: [
        Container(
          height: height * 0.049,
          decoration: BoxDecoration(
            color: Palete.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
          ),
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Palete.darkblue,
              size: 25,
            ),
          ),
        ),
      ],
      title: Text(
        'BlueRibbon',
        style: TextStyle(
            color: Palete.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            height: 1.2),
      ),
    );
  }
}