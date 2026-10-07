import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(user.profileImageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.username,
                  style: AppTextStyles.heading2.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  user.bio,
                  style: AppTextStyles.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('Debates: ${user.totalDebates}', style: AppTextStyles.body.copyWith(fontSize: 12)),
                    const SizedBox(width: 16),
                    Text('Wins: ${user.wins}', style: AppTextStyles.body.copyWith(fontSize: 12, color: AppColors.accentGreen)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
