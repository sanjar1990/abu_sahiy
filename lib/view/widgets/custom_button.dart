import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:abu_sahiy/data/tools/styles/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final bool isPressed;
  final VoidCallback callback;
  final bool isColorChange;

  const CustomButton(
      {super.key,
      required this.title,
      required this.callback,
      this.isColorChange = false,
      this.isPressed = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isPressed ? null : callback(),
      child: Container(
        height: 52.h,

        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            color: isColorChange ? ResColors.primaryColor : ResColors.primaryColorLight,
        ),
        child: Text(
          title,
          style: theme.displayLarge?.copyWith(color: ResColors.white, fontWeight: FontWeight.w700, fontSize: 16.sp),
        ),
      ),
    );
  }
}
