import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key, required this.text, required this.isSelected});
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: isSelected?ResColors.primaryColor:ResColors.unSelectedText,
      fontSize: 18,
      fontWeight: FontWeight.w700
    ),);
  }
}
