import 'package:flutter/material.dart';
import 'package:test_assignment/utils/app_constants.dart';

class AvatarStack extends StatelessWidget {

  final int reviewCount;
  const AvatarStack({super.key, required this.reviewCount});

  static const _avatarUrls = [
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50',
    'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 36,
          height: 22,
          child: Stack(
            children: _avatarUrls.asMap().entries.map((e) {
              return Positioned(
                left: e.key * 13.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(e.value),
                    onBackgroundImageError: (_, _) {},
                    backgroundColor: AppColors.grayLight,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.grayLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '+$reviewCount',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textGray,
            ),
          ),
        ),
      ],
    );
  }
}