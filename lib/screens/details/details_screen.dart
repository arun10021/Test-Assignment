import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_assignment/screens/details/widgets/expedanble_read.dart';
import '../schedule_screen/providers/schedule_provider.dart';
import '../../providers/destinatioN_provider.dart';
import '../../utils/app_constants.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DestinationProvider>();
    final destination = provider.selectedDestination;
    

    if (destination == null) {
      return const Scaffold(body: Center(child: Text('No destination selected')));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.network(
              destination.galleryImages[provider.imageIndex],
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: AppColors.grayLight,
                child: const Icon(Icons.image, size: 80, color: AppColors.textGray),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name + avatar
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination.name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  destination.location,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          CircleAvatar(
                            radius: 26,
                            backgroundImage: const NetworkImage(
                              'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100',
                            ),
                            onBackgroundImageError: (_, _) {},
                            backgroundColor: AppColors.grayLight,
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),


                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              size: 15, color: AppColors.textGray),
                          const SizedBox(width: 3),
                          Text(
                            destination.country,
                            style: const TextStyle(
                                fontSize: 13, color: AppColors.textGray),
                          ),
                          const SizedBox(width: 14),
                          const Icon(Icons.star,
                              size: 15, color: AppColors.starColor),
                          const SizedBox(width: 3),
                          Text(
                            '${destination.rating}(${destination.reviewCount})',
                            style: const TextStyle(
                                fontSize: 13, color: AppColors.textGray),
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$${destination.pricePerPerson.toInt()}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const TextSpan(
                                  text: '/Person',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Gallery thumbnails
                    SizedBox(
                      height: 64,
                      child: Row(
                        children: [
                          ...destination.galleryImages.take(4).toList().asMap().entries.map(
                                (entry) {
                              final index = entry.key;
                              final url = entry.value;

                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    provider.setImageIndex(index);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      url,
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, _, _) => Container(
                                        width: 64,
                                        height: 64,
                                        color: AppColors.grayLight,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          if (destination.galleryImages.length > 4)
                            GestureDetector(
                              onTap: () {
                                provider.setImageIndex(4);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      destination.galleryImages[4],
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, _, _) => Container(
                                        width: 64,
                                        height: 64,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    Container(
                                      width: 64,
                                      height: 64,
                                      color: Colors.black.withValues(alpha: 0.55), // fixed here
                                      child: Center(
                                        child: Text(
                                          '+${destination.galleryImages.length - 4}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),


                      const SizedBox(height: 20),

                      const Text(
                        'About Destination',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 10),

                      ExpandableDescription(description: destination.description),

                      const SizedBox(height: 20),

                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          color: AppColors.textDark,
                          size: 26,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => provider.toggleFavorite(destination.id),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          destination.isFavorite
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: destination.isFavorite
                              ? AppColors.primary
                              : AppColors.textDark,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}


