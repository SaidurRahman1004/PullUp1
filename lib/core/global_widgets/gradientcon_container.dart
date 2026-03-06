import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';

class GradientIconContainer extends StatelessWidget {
  final String assetPath;
  final double size;
  final double iconSize;

  const GradientIconContainer({
    super.key,
    required this.assetPath,
    this.size = 80.0,
    this.iconSize = 38.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: AppColors.iconGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF6366F1),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: -5,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          width: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}