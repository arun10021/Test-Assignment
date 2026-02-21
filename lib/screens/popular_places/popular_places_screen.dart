import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_assignment/screens/popular_places/widgets/fliter_sheet.dart';
import 'package:test_assignment/screens/popular_places/widgets/place_card.dart';
import '../../providers/app_provider.dart';
import '../../utils/app_constants.dart';
import '../../models/destination_model.dart';
import '../details/details_screen.dart';

class PopularPlacesScreen extends StatelessWidget {
  const PopularPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DestinationProvider>();
    final destinations = provider.filteredDestinations;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.grayLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.chevron_left, color: AppColors.textDark),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Popular Places',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showFilterBottomSheet(context, provider),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.grayLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.tune, color: AppColors.textDark, size: 20),
                    ),
                  ),
                ],
              ),
            ),

            // Section title
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: Text(
                'All Popular Places',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),

            // Grid
            Expanded(
              child: destinations.isEmpty
                  ? const Center(
                child: Text(
                  'No destinations found',
                  style: TextStyle(color: AppColors.textGray),
                ),
              )
                  : GridView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.78,
                ),
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return PlaceCard(destination: destinations[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context, DestinationProvider provider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => FilterSheet(provider: provider),
    );
  }
}



