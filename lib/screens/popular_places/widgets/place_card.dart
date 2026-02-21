import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_assignment/models/destination_model.dart';
import 'package:test_assignment/providers/app_provider.dart';
import 'package:test_assignment/screens/details/details_screen.dart';
import 'package:test_assignment/utils/app_constants.dart';

class PlaceCard extends StatelessWidget {
  final DestinationModel destination;
  const PlaceCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<DestinationProvider>();

    return GestureDetector(
      onTap: () {
        provider.setSelectedDestination(destination);
        Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with favorite
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    destination.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      color: AppColors.grayLight,
                      child: const Icon(Icons.image, size: 40, color: AppColors.textGray),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () => provider.toggleFavorite(destination.id),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Icon(
                        destination.isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: destination.isFavorite ? Colors.red : AppColors.textGray,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Info
          Text(
            destination.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 12, color: AppColors.textGray),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  destination.location,
                  style: const TextStyle(fontSize: 12, color: AppColors.textGray),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(
                5,
                    (i) => Icon(
                  Icons.star,
                  size: 12,
                  color: i < destination.rating.floor()
                      ? AppColors.starColor
                      : AppColors.grayLight,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${destination.rating}',
                style: const TextStyle(fontSize: 12, color: AppColors.textGray),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            '\$${destination.pricePerPerson.toInt()}/Person',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}