import 'user_model.dart';
import 'topic_model.dart';

enum DebateStatus { matching, active, completed }

class DebateModel {
  final String id;
  final TopicModel topic;
  final UserModel debaterA;
  final UserModel? debaterB;
  final DebateStatus status;
  final String? winnerId;

  DebateModel({
    required this.id,
    required this.topic,
    required this.debaterA,
    this.debaterB,
    required this.status,
    this.winnerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topic': topic.toJson(),
      'debaterA': debaterA.toJson(),
      'debaterB': debaterB?.toJson(),
      'status': status.toString(),
      'winnerId': winnerId,
    };
  }

  factory DebateModel.fromJson(Map<String, dynamic> json) {
    return DebateModel(
      id: json['id'] ?? '',
      topic: TopicModel.fromJson(json['topic'] ?? {}),
      debaterA: UserModel.fromJson(json['debaterA'] ?? {}),
      debaterB: json['debaterB'] != null ? UserModel.fromJson(json['debaterB']) : null,
      status: DebateStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => DebateStatus.matching,
      ),
      winnerId: json['winnerId'],
    );
  }
}
