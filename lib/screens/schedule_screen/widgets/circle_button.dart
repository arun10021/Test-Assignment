import 'package:flutter/material.dart';
import 'package:test_assignment/utils/app_constants.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.grayLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: AppColors.textDark, size: 22),
      ),
    );
  }
}