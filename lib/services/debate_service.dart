import '../models/topic_model.dart';
import '../models/debate_model.dart';
import '../models/user_model.dart';

class DebateService {
  final List<TopicModel> _topics = [
    TopicModel(
      id: 't1',
      title: 'Artificial Intelligence will replace human creativity.',
      category: 'Technology',
      description: 'Discuss whether generative AI is a tool or a replacement for artists and writers.',
      activeDebaters: 120,
    ),
    TopicModel(
      id: 't2',
      title: 'Remote work is better than office work for productivity.',
      category: 'Lifestyle',
      description: 'Weighing work-life balance, collaboration, and efficiency in remote settings.',
      activeDebaters: 85,
    ),
    TopicModel(
      id: 't3',
      title: 'Space exploration funding should be redirected to Earth issues.',
      category: 'Science',
      description: 'Prioritizing climate change and poverty vs. interplanetary advancement.',
      activeDebaters: 64,
    ),
    TopicModel(
      id: 't4',
      title: 'Universal Basic Income is necessary for the future economy.',
      category: 'Economics',
      description: 'Addressing automation, wealth inequality, and social safety nets.',
      activeDebaters: 95,
    ),
  ];

  List<TopicModel> getTopics() => _topics;

  Future<DebateModel> findOpponent(TopicModel topic, UserModel user) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate matchmaking delay

    final opponent = UserModel(
      id: 'opp_99',
      username: 'SilverTongue',
      profileImageUrl: 'https://i.pravatar.cc/150?img=45',
      age: 26,
      bio: 'Here to challenge your perspectives.',
      totalDebates: 22,
      wins: 14,
    );

    return DebateModel(
      id: 'debate_${DateTime.now().millisecondsSinceEpoch}',
      topic: topic,
      debaterA: user,
      debaterB: opponent,
      status: DebateStatus.active,
    );
  }
}
