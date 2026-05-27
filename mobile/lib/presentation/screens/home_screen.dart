import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../config/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCity = 0;
  final cities = ['Baghdad', 'Karbala', 'Najaf'];
  final arabicCities = ['بغداد', 'كربلاء', 'النجف'];
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int guests = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightDarkColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header with background
            SliverAppBar(
              expandedHeight: 250,
              backgroundColor: AppTheme.lightDarkColor,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    // Background gradient
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppTheme.surfaceColor,
                            AppTheme.lightDarkColor,
                          ],
                        ),
                      ),
                    ),
                    // Decorative elements
                    Positioned(
                      top: -50,
                      right: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primaryColor.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -50,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primaryColor.withOpacity(0.05),
                        ),
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: AppTheme.textColor,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Find your perfect stay',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppTheme.textSecondaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Search and filters
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // City selector
                    Text(
                      'Select City',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => setState(() => _selectedCity = index),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: _selectedCity == index
                                        ? AppTheme.primaryColor
                                        : AppTheme.dividerColor,
                                    width: _selectedCity == index ? 2 : 1,
                                  ),
                                  color: _selectedCity == index
                                      ? AppTheme.primaryColor.withOpacity(0.1)
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    arabicCities[index],
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: _selectedCity == index
                                              ? AppTheme.primaryColor
                                              : AppTheme.textSecondaryColor,
                                          fontWeight: _selectedCity == index
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Date and guests picker
                    Text(
                      'Travel Dates',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: GlassmorphismContainer(
                            width: double.infinity,
                            height: 50,
                            borderRadius: 12,
                            blur: 20,
                            color: AppTheme.surfaceColor.withOpacity(0.1),
                            border: 1.5,
                            borderColor: AppTheme.dividerColor.withOpacity(0.5),
                            child: TextButton(
                              onPressed: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(const Duration(days: 365)),
                                );
                                if (date != null) {
                                  setState(() => checkInDate = date);
                                }
                              },
                              child: Text(
                                checkInDate != null
                                    ? '${checkInDate!.day}/${checkInDate!.month}'
                                    : 'Check In',
                                style: TextStyle(
                                  color: checkInDate != null
                                      ? AppTheme.primaryColor
                                      : AppTheme.textSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GlassmorphismContainer(
                            width: double.infinity,
                            height: 50,
                            borderRadius: 12,
                            blur: 20,
                            color: AppTheme.surfaceColor.withOpacity(0.1),
                            border: 1.5,
                            borderColor: AppTheme.dividerColor.withOpacity(0.5),
                            child: TextButton(
                              onPressed: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: checkInDate ?? DateTime.now().add(const Duration(days: 1)),
                                  firstDate: checkInDate ?? DateTime.now(),
                                  lastDate: DateTime.now().add(const Duration(days: 365)),
                                );
                                if (date != null) {
                                  setState(() => checkOutDate = date);
                                }
                              },
                              child: Text(
                                checkOutDate != null
                                    ? '${checkOutDate!.day}/${checkOutDate!.month}'
                                    : 'Check Out',
                                style: TextStyle(
                                  color: checkOutDate != null
                                      ? AppTheme.primaryColor
                                      : AppTheme.textSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Search button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // Search logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: AppTheme.darkColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Search Hotels',
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
            ),
            // Featured hotels
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Hotels',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    // Hotel cards placeholder
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppTheme.dividerColor,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  Container(
                                    color: AppTheme.surfaceColor,
                                    child: const Placeholder(),
                                  ),
                                  // Overlay
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            AppTheme.lightDarkColor.withOpacity(0.9),
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Hotel Name',
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '⭐ 4.5 (250 reviews)',
                                                style: Theme.of(context).textTheme.bodySmall,
                                              ),
                                              Text(
                                                '50,000 IQD',
                                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                      color: AppTheme.primaryColor,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Favorite button
                                  Positioned(
                                    top: 12,
                                    right: 12,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppTheme.darkColor.withOpacity(0.7),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          color: AppTheme.primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: AppTheme.darkColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
