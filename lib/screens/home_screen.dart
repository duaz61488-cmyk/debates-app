import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../services/debate_service.dart';
import '../widgets/topic_card.dart';
import 'topics_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';
import 'find_opponent_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final DebateService _debateService = DebateService();

  @override
  Widget build(BuildContext context) {
    final topics = _debateService.getTopics();

    final List<Widget> screens = [
      // Home Tab: Topics feed
      Scaffold(
        backgroundColor: AppColors.backgroundDark,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDark,
          title: const Text('Trending Debates', style: TextStyle(color: AppColors.textPrimary)),
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
      ),
      const TopicsScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.surfaceDark,
        indicatorColor: AppColors.primary.withOpacity(0.3),
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: AppColors.textSecondary),
            selectedIcon: Icon(Icons.home, color: AppColors.primary),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined, color: AppColors.textSecondary),
            selectedIcon: Icon(Icons.explore, color: AppColors.primary),
            label: 'Topics',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined, color: AppColors.textSecondary),
            selectedIcon: Icon(Icons.history, color: AppColors.primary),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.textSecondary),
            selectedIcon: Icon(Icons.person, color: AppColors.primary),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
