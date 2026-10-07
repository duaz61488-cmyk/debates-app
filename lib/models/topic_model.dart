class TopicModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final int activeDebaters;

  TopicModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    this.activeDebaters = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'activeDebaters': activeDebaters,
    };
  }

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      activeDebaters: json['activeDebaters'] ?? 0,
    );
  }
}
