import 'package:flutter/material.dart';
import '../models/debate_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';

class DebateCard extends StatelessWidget {
  final DebateModel debate;
  final VoidCallback onTap;

  const DebateCard({
    super.key,
    required this.debate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: onTap,
        title: Text(
          debate.topic.title,
          style: AppTextStyles.heading2.copyWith(fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.between,
            children: [
              Text(
                'Vs ${debate.debaterB?.username ?? "Waiting..."}',
                style: AppTextStyles.subtitle.copyWith(color: AppColors.secondary),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: debate.status == DebateStatus.active ? AppColors.accentGreen.withOpacity(0.2) : AppColors.cardDark,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  debate.status.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: debate.status == DebateStatus.active ? AppColors.accentGreen : AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
