import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_assignment/screens/home/provider/navigation_provider.dart';
import 'package:test_assignment/screens/home/widgets/home_best_destination_card.dart';
import 'package:test_assignment/screens/home/widgets/home_bottom_nav_bar.dart';
import 'package:test_assignment/screens/home/widgets/home_package_card.dart';
import '../../providers/app_provider.dart';
import '../../utils/app_constants.dart';
import '../popular_places/popular_places_screen.dart';
import '../popularPackage/popular_package_screen.dart';
import '../schedule_screen/schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeBody();
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigationProvider>();

    final pages = [
      const _HomeContent(),
      const ScheduleScreen(),
      const SizedBox(),
      const Center(child: Text('Messages')),
      const Center(child: Text('Profile')),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: pages[navProvider.currentIndex],
      bottomNavigationBar: BottomNav(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Home content
// ─────────────────────────────────────────────────────────────────────────────

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DestinationProvider>();

    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.grayLight,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.textDark,
                          size: 22,
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 7,
                        child: Container(
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),


                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
                    decoration: BoxDecoration(
                      color: AppColors.grayLight,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: const NetworkImage(
                            'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100',
                          ),
                          onBackgroundImageError: (_, __) {},
                          backgroundColor: AppColors.grayLight,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Imane',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                    height: 1.25,
                  ),
                  children: [
                    TextSpan(text: 'Discover the wonders\nof the '),
                    TextSpan(
                      text: 'world!',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
              child: Row(
                children: [
                  const SizedBox(width: 130),
                  CustomPaint(
                    size: const Size(76, 8),
                    painter: _UnderlinePainter(),
                  ),
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
              child: Row(
                children: [
                  const Text(
                    'Best Destination',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PopularPlacesScreen()),
                    ),
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20, right: 6),
                itemCount: provider.allDestinations.length,
                itemBuilder: (context, index) {
                  return BestDestinationCard(
                    destination: provider.allDestinations[index],
                  );
                },
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 12),
              child: Row(
                children: [
                  const Text(
                    'Popular Packages',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PopularPackageScreen()),
                    ),
                    child: const Text(
                      'View all',
                      style: TextStyle(fontSize: 14, color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemCount: provider.packages.length,
                itemBuilder: (context, index) {
                  final pkg = provider.packages[index];
                  return PackageCard(package: pkg);
                },
              ),
            ),
          ),

          const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
        ],
      ),
    );
  }
}


class _UnderlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.3,
        -5,
        size.width * 0.7,
        size.height * 0.7,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}





