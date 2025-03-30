class ExerciseBodyPart {
  final List<String> bodyParts;

  ExerciseBodyPart({required this.bodyParts});

  factory ExerciseBodyPart.fromJson(List<dynamic> json) {
    return ExerciseBodyPart(
      bodyParts: List<String>.from(json),
    );
  }
}

class Exercise_Search {
  final String id;
  final String name;
  final String bodyPart;
  final String image;

  Exercise_Search({
    required this.id,
    required this.name,
    required this.bodyPart,
    required this.image,
  });

  factory Exercise_Search.fromJson(Map<String, dynamic> json) {
    return Exercise_Search(
      id: json['id'],
      name: json['name'],
      bodyPart: json['bodyPart'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bodyPart': bodyPart,
      'image': image,
    };
  }
}

class Exercise_BodyPart_BodyPart {
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final String id;
  final String name;
  final String target;
  final List<String> secondaryMuscles;
  final List<String> instructions;

  Exercise_BodyPart_BodyPart({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
    required this.secondaryMuscles,
    required this.instructions,
  });

  factory Exercise_BodyPart_BodyPart.fromJson(Map<String, dynamic> json) {
    return Exercise_BodyPart_BodyPart(
      bodyPart: json['bodyPart'],
      equipment: json['equipment'],
      gifUrl: json['gifUrl'],
      id: json['id'],
      name: json['name'],
      target: json['target'],
      secondaryMuscles: List<String>.from(json['secondaryMuscles']),
      instructions: List<String>.from(json['instructions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bodyPart': bodyPart,
      'equipment': equipment,
      'gifUrl': gifUrl,
      'id': id,
      'name': name,
      'target': target,
      'secondaryMuscles': secondaryMuscles,
      'instructions': instructions,
    };
  }
}
