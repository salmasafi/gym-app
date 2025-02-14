 import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';

Widget buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:  TextStyle(
              fontSize: 14,
              color:AppColors.purpleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:  TextStyle(color:AppColors.blackColor),
              filled: true,
              fillColor:AppColors.whiteColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
            style:  TextStyle(color:AppColors.blackColor),
          ),
        ],
      ),
    );
  }

