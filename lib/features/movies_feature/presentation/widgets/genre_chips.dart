
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';

class GenreChips extends StatelessWidget {
  const GenreChips({
    super.key,
    required this.height,
    required this.width,
    required this.selectedGenere,
    required this.index,
  });

  final double height;
  final double width;
  final int selectedGenere;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.04,
      width: width * 0.25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
            color: selectedGenere == index ? Palete.white : Palete.purple),
        borderRadius: BorderRadius.circular(10),
        color: selectedGenere == index ? Palete.purple : Palete.white,
      ),
      child: Text(
        index == 0 ? 'All' : 'Action',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: selectedGenere == index ? Palete.white : Colors.black),
      ),
    );
  }
}