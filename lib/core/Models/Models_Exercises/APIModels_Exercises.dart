class Exercise {
  final String id;
  final String name;
  final String bodyPart;
  final String? equipment;
  final String? gifUrl;
  final String? target;
  final List<String>? secondaryMuscles;
  final List<String>? instructions;
  final String? imageUrl;

  Exercise({
    required this.id,
    required this.name,
    required this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.target,
    this.secondaryMuscles,
    this.instructions,
    this.imageUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      bodyPart: json['bodyPart'] ?? json['bodypart'] ?? '',
      equipment: json['equipment'],
      gifUrl: json['gifUrl'] ?? json['public'],
      target: json['target'],
      secondaryMuscles:
          json['secondaryMuscles'] != null
              ? List<String>.from(json['secondaryMuscles'])
              : json['secondarywatch'] != null
              ? List<String>.from(json['secondarywatch'])
              : null,
      instructions:
          json['instructions'] != null
              ? List<String>.from(json['instructions'])
              : null,
      imageUrl:
          (json['image'] != null &&
                  json['image'] != 'image_coming_soon' &&
                  json['image'] != 'image_tuning_som')
              ? json['image']
              : null,
    );
  }
}
