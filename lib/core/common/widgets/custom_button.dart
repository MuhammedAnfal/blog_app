import 'package:blog_app/core/theme/palette.dart' show Palette;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double borderRadius, buttonHeight, buttonWidth;
  final String buttonText;
  final Color bgColor;
  final EdgeInsetsGeometry margin;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.borderRadius,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonText,
    required this.bgColor,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(borderRadius),
              side: BorderSide(color: Palette.primaryColor),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              color: Palette.secondaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
