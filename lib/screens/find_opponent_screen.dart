import 'package:flutter/material.dart';
import '../models/topic_model.dart';
import '../services/debate_service.dart';
import '../services/auth_service.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';
import 'debate_screen.dart';

class FindOpponentScreen extends StatefulWidget {
  final TopicModel topic;

  const FindOpponentScreen({super.key, required this.topic});

  @override
  State<FindOpponentScreen> createState() => _FindOpponentScreenState();
}

class _FindOpponentScreenState extends State<FindOpponentScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final DebateService _debateService = DebateService();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _startMatchmaking();
  }

  void _startMatchmaking() async {
    final user = _authService.currentUser;
    if (user == null) return;

    final debate = await _debateService.findOpponent(widget.topic, user);
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DebateScreen(debate: debate),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _controller,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 4),
                  ),
                  child: const Center(
                    child: Icon(Icons.mic, size: 48, color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Text('Finding Opponent...', style: AppTextStyles.heading1),
              const SizedBox(height: 12),
              Text(
                widget.topic.title,
                style: AppTextStyles.subtitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.secondary),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('Cancel', style: AppTextStyles.button.copyWith(color: AppColors.secondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
