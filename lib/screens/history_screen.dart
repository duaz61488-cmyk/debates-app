import 'package:flutter/material.dart';
import '../models/debate_model.dart';
import '../models/topic_model.dart';
import '../models/user_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';
import '../widgets/debate_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DebateModel> history = [
      DebateModel(
        id: 'h1',
        topic: TopicModel(
          id: 't1',
          title: 'Artificial Intelligence will replace human creativity.',
          category: 'Technology',
          description: 'AI vs Human creativity',
        ),
        debaterA: UserModel(id: 'u1', username: 'You', profileImageUrl: 'https://i.pravatar.cc/150?img=12', age: 24, bio: ''),
        debaterB: UserModel(id: 'u2', username: 'CyberSkeptic', profileImageUrl: 'https://i.pravatar.cc/150?img=22', age: 28, bio: ''),
        status: DebateStatus.completed,
        winnerId: 'u1',
      ),
      DebateModel(
        id: 'h2',
        topic: TopicModel(
          id: 't2',
          title: 'Remote work is better than office work for productivity.',
          category: 'Lifestyle',
          description: 'Remote vs Office',
        ),
        debaterA: UserModel(id: 'u1', username: 'You', profileImageUrl: 'https://i.pravatar.cc/150?img=12', age: 24, bio: ''),
        debaterB: UserModel(id: 'u3', username: 'OfficeAdvocate', profileImageUrl: 'https://i.pravatar.cc/150?img=35', age: 30, bio: ''),
        status: DebateStatus.completed,
        winnerId: 'u3',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text('Debate History', style: AppTextStyles.heading2),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final debate = history[index];
          return DebateCard(
            debate: debate,
            onTap: () {},
          );
        },
      ),
    );
  }
}
