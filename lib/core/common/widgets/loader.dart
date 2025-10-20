import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
