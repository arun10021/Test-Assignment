import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_assignment/screens/popularPackage/widgets/package_list_item.dart';
import '../../providers/destinatioN_provider.dart';
import '../../utils/app_constants.dart';

class PopularPackageScreen extends StatelessWidget {
  const PopularPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DestinationProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        'Popular Package',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: Text(
                'All Popular Trip Package',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: provider.packages.length,
                separatorBuilder: (_, _) => const Divider(color: Color(0xFFF0F0F0), height: 1),
                itemBuilder: (context, index) {
                  final package = provider.packages[index];
                  return PackageListItem(package: package);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

