import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.gradient = const LinearGradient(
      colors: [
        Color(0xFFFFCD1E),
        Color(0xFFF19B15),
      ],
    ),
    required this.text,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
    this.borderColor = const Color(0xFFF19B15),
    this.borderRadius = const BorderRadius.all(Radius.circular(30.0)),
    // BorderRadius? borderRadius,
  });
  // : borderRadius = borderRadius ?? BorderRadius.circular(30.0);

  const CustomButton.outlined({
    super.key,
    this.onPressed,
    this.gradient = const LinearGradient(
      colors: [
        Colors.white,
        Colors.white,
      ],
    ),
    required this.text,
    this.textColor = const Color(0xFFF19B15),
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
    this.borderColor = const Color(0xFFF19B15),
    this.borderRadius = const BorderRadius.all(Radius.circular(30.0)),
    // BorderRadius? borderRadius,
  });

  final Function()? onPressed;
  final LinearGradient gradient;
  final String text;
  final Color textColor;
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
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
