import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    this.onPressed,
    this.gradient = const LinearGradient(
      colors: [
        Colors.white,
                Colors.white,

      ],
    ),
    required this.icon,
    this.iconColor = const Color(0xFFF19B15),
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.all(10.0),
    this.borderColor = const Color(0xFFF19B15),
    this.borderRadius = const BorderRadius.all(Radius.circular(30.0)),
    // BorderRadius? borderRadius,
  });
  // : borderRadius = borderRadius ?? BorderRadius.circular(30.0);

  final Function()? onPressed;
  final LinearGradient gradient;
  final String icon;
  final Color iconColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          gradient: gradient,
          border: Border.all(color: const Color(0xFFF19B15)),
          borderRadius: borderRadius,
        ),
        child: SvgPicture.asset(icon,color: iconColor,),
      ),
    );
  }
}
