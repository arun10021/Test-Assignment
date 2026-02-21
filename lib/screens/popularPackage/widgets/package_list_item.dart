import 'package:flutter/material.dart';
import 'package:test_assignment/models/destination_model.dart';
import 'package:test_assignment/utils/app_constants.dart';

class PackageListItem extends StatelessWidget {
  final TripPackageModel package;
  const PackageListItem({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              package.imageUrl,
              width: 110,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 110,
                height: 100,
                color: AppColors.grayLight,
                child: const Icon(Icons.image, color: AppColors.textGray),
              ),
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        package.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '\$${package.price.toInt()}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textGray),
                    const SizedBox(width: 4),
                    Text(
                      '${package.startDate}-${package.endDate}',
                      style: const TextStyle(fontSize: 13, color: AppColors.textGray),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    ...List.generate(
                      5,
                          (i) => Icon(
                        Icons.star,
                        size: 14,
                        color: i < package.rating.floor()
                            ? AppColors.starColor
                            : AppColors.grayLight,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${package.rating}',
                      style: const TextStyle(fontSize: 13, color: AppColors.textGray),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 24,
                      child: Stack(
                        children: package.avatarUrls
                            .take(2)
                            .toList()
                            .asMap()
                            .entries
                            .map(
                              (entry) => Positioned(
                            left: entry.key * 16.0,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 11,
                                backgroundImage: NetworkImage(entry.value),
                                onBackgroundImageError: (_, __) {},
                                backgroundColor: AppColors.grayLight,
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${package.personJoined} Person Joined',
                      style: const TextStyle(fontSize: 12, color: AppColors.textGray),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}