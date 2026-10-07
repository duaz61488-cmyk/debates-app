import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';
import '../services/debate_service.dart';
import '../widgets/topic_card.dart';
import 'find_opponent_screen.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final debateService = DebateService();
    final topics = debateService.getTopics();

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text('Explore Topics', style: AppTextStyles.heading2),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return TopicCard(
            topic: topic,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FindOpponentScreen(topic: topic),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
