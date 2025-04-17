import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FoodAnalysisScreen extends StatefulWidget {
  @override
  _FoodAnalysisScreenState createState() => _FoodAnalysisScreenState();
}

class _FoodAnalysisScreenState extends State<FoodAnalysisScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0B1E),
      appBar: AppBar(
        backgroundColor: const Color(0xff0D0B1E),
        foregroundColor: AppColors.whiteColor,
        title: const Text(
          "Food Analyzer",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             Text(
              "📸 Upload Your Food Image",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff2B2A40),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.add_a_photo_rounded,
                          color: Colors.white60,
                          size: 40,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (_image != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Analyzing your food...")),
                  );
                }
              },
              icon: const Icon(Icons.analytics),
              label: const Text("Analyze Food"),
              style: ElevatedButton.styleFrom(
                backgroundColor:  AppColors.primaryColor,

                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
