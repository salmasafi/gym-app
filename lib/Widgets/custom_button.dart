import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? textColor;
  final double? fontSize;
  final Widget? icon;
  final Widget? trailingIcon;
  final VoidCallback? onPress;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.fontSize,
    this.icon,
    this.trailingIcon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width ?? screenWidth * 0.8, 
      height: height ?? screenHeight * 0.07, 
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.black87, // Default dark color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: fontSize ?? 16,
              ),
            ),
            if (trailingIcon != null) const SizedBox(width: 8),
            if (trailingIcon != null) trailingIcon!,
          ],
        ),
      ),
    );
  }
}
