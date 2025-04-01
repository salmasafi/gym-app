import 'dart:convert';
import 'package:gym_app/models/APIModels_Exersice.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://www.gymfit.somee.com/api';

  Future<List<String>> getBodyParts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/Exercise/bodypart/list'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        if (data is List) {
          return data.map((e) => e.toString()).toList();
        }
        return ['back', 'cardio', 'chest', 'arms', 'legs']; // Fallback
      }
      throw Exception('HTTP ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to load body parts: $e');
    }
  }

  Future<List<Exercise>> getExercisesByBodyPart(
    String bodyPart, {
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/Exercise/bodypart/$bodyPart?limit=$limit&offset=$offset',
        ),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        if (data is List) {
          return data.map((e) => Exercise.fromJson(e)).toList();
        } else if (data is Map && data.containsKey('results')) {
          return (data['results'] as List)
              .map((e) => Exercise.fromJson(e))
              .toList();
        }
        return [Exercise.fromJson(data)];
      }
      throw Exception('HTTP ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to load exercises: $e');
    }
  }

  Future<List<Exercise>> searchExercises(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/Exercise/search?query=$query'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        if (data is List) {
          return data.map((e) => Exercise.fromJson(e)).toList();
        } else if (data is Map && data.containsKey('results')) {
          return (data['results'] as List)
              .map((e) => Exercise.fromJson(e))
              .toList();
        }
        return [Exercise.fromJson(data)];
      }
      throw Exception('HTTP ${response.statusCode}');
    } catch (e) {
      throw Exception('Search error: $e');
    }
  }
}
