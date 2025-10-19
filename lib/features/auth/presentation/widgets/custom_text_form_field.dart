import 'package:blog_app/core/theme/palette.dart' show Palette;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  const CustomTextFormField({
    super.key,
    required this.emailController,
    required this.labelText,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Palette.buttonColor),
        ),
      ),
    );
  }
}
