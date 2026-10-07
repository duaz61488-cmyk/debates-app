import 'package:flutter/material.dart';
import '../models/debate_model.dart';
import '../services/audio_service.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';
import '../widgets/audio_button.dart';

class DebateScreen extends StatefulWidget {
  final DebateModel debate;

  const DebateScreen({super.key, required this.debate});

  @override
  State<DebateScreen> createState() => _DebateScreenState();
}

class _DebateScreenState extends State<DebateScreen> {
  final AudioService _audioService = AudioService();
  bool _isMuted = false;

  void _toggleMute() async {
    await _audioService.toggleMute();
    setState(() {
      _isMuted = _audioService.isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.debate.topic.category, style: AppTextStyles.subtitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              widget.debate.topic.title,
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Debater A
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(widget.debate.debaterA.profileImageUrl),
                      ),
                      const SizedBox(height: 12),
                      Text(widget.debate.debaterA.username, style: AppTextStyles.button),
                      const SizedBox(height: 4),
                      Text('Speaker A', style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
                    ],
                  ),
                  Text('VS', style: AppTextStyles.heading1.copyWith(color: AppColors.secondary)),
                  // Debater B
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(widget.debate.debaterB?.profileImageUrl ?? 'https://i.pravatar.cc/150'),
                      ),
                      const SizedBox(height: 12),
                      Text(widget.debate.debaterB?.username ?? 'Opponent', style: AppTextStyles.button),
                      const SizedBox(height: 4),
                      Text('Speaker B', style: AppTextStyles.subtitle.copyWith(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.cardDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('02:45 remaining', style: AppTextStyles.subtitle.copyWith(color: AppColors.accentGreen)),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AudioButton(
                  isMuted: _isMuted,
                  onPressed: _toggleMute,
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  backgroundColor: AppColors.accentRed,
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(Icons.call_end, color: AppColors.textPrimary),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
