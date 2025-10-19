import 'package:blog_app/features/auth/presentation/widgets/custom_curved_widget.dart';
import 'package:flutter/material.dart';

class AppCurvedLoginWidget extends StatelessWidget {
  final Widget child;
  const AppCurvedLoginWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedWidget(), child: child);
  }
}
