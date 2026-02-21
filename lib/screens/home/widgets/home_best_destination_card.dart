import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_assignment/models/destination_model.dart';
import 'package:test_assignment/providers/app_provider.dart';
import 'package:test_assignment/screens/details/details_screen.dart';
import 'package:test_assignment/utils/app_constants.dart';

import 'home_avatar_stack.dart';

class BestDestinationCard extends StatelessWidget {

  final DestinationModel destination;
  const BestDestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<DestinationProvider>();

    return GestureDetector(
      onTap: () {
        provider.setSelectedDestination(destination);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DetailsScreen()),
        );
      },
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    destination.imageUrl,
                    width: 220,
                    height: 230,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 220,
                      height: 230,
                      decoration: BoxDecoration(
                        color: AppColors.grayLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.image, size: 48, color: AppColors.textGray),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () => provider.toggleFavorite(destination.id),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        destination.isFavorite
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        size: 18,
                        color: destination.isFavorite
                            ? AppColors.primary
                            : AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Destination name
            Text(
              destination.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 6),

            // Location | star | avatar stack
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 13, color: AppColors.textGray),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    destination.country,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textGray),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.star, size: 13, color: AppColors.starColor),
                const SizedBox(width: 2),
                Text(
                  '${destination.rating}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(width: 8),
                AvatarStack(reviewCount: destination.reviewCount),
              ],
            ),
          ],
        ),
      ),
    );
  }
}