import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';
import 'home_screen.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  double _selectedAge = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verify Your Age', style: AppTextStyles.heading1),
            const SizedBox(height: 8),
            Text('Debates requires users to be at least 13 years old.', style: AppTextStyles.subtitle),
            const SizedBox(height: 48),
            Center(
              child: Text(
                '${_selectedAge.toInt()} years',
                style: AppTextStyles.heading1.copyWith(color: AppColors.primary, fontSize: 48),
              ),
            ),
            const SizedBox(height: 24),
            Slider(
              value: _selectedAge,
              min: 13,
              max: 80,
              divisions: 67,
              activeColor: AppColors.primary,
              inactiveColor: AppColors.cardDark,
              onChanged: (value) {
                setState(() {
                  _selectedAge = value;
                });
              },
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Confirm & Proceed', style: AppTextStyles.button),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
