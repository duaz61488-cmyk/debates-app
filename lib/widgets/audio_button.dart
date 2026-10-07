import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AudioButton extends StatelessWidget {
  final bool isMuted;
  final VoidCallback onPressed;

  const AudioButton({
    super.key,
    required this.isMuted,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: isMuted
                ? [AppColors.accentRed, Colors.redAccent]
                : [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: (isMuted ? AppColors.accentRed : AppColors.primary).withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          isMuted ? Icons.mic_off : Icons.mic,
          color: AppColors.textPrimary,
          size: 36,
        ),
      ),
    );
  }
}
