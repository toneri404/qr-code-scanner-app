import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool circular;

  const AppLogo({
    super.key,
    this.size = 36,
    this.circular = false,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      'assets/example.jpg',
      width: size,
      height: size,
      fit: BoxFit.cover,
    );

    if (circular) {
      return ClipOval(child: image);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: image,
    );
  }
}
