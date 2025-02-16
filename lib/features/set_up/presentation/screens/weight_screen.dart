import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightSelectionScreen extends StatefulWidget {
  @override
  _WeightSelectionScreenState createState() => _WeightSelectionScreenState();
}

class _WeightSelectionScreenState extends State<WeightSelectionScreen> {
  int _currentWeight = 60;
  bool isKg = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
       leading: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerRight,
          icon: Image.asset('assets/icons/Arrow.png'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          child: Text(
            "Back",
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 16 , fontWeight: FontWeight.bold),
          ),
        ),
        ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What Is Your Weight?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:AppColors.blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod...",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 58,
            width: 325,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.yellow.shade600,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKg = true;
                    });
                  },
                  child: Text(
                    "KG",
                    style: TextStyle(
                      color: isKg ? Colors.black : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                VerticalDivider(color: Colors.black, thickness: 1, width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKg = false;
                    });
                  },
                  child: Text(
                    "LB",
                    style: TextStyle(
                      color: !isKg ? Colors.black : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple.shade200,
             
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: NumberPicker(
              value: _currentWeight,
              itemHeight: 50,
              itemCount: 6,
             
              
              minValue: 30,
              maxValue: 200,
              axis: Axis.horizontal,
              selectedTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              onChanged: (value) {
                setState(() {
                  _currentWeight = value;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Icon(Icons.arrow_drop_up, color: Colors.yellow, size: 50),
          SizedBox(height: 5),
          Text(
            "$_currentWeight ${isKg ? 'Kg' : 'Lb'}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          CustomButton(
          buttonText: "Next",
          onPress: () {},
          width: 178,
          height: 44,
          buttonColor: Color(0xff373737),
          borderRadius: 30,
        ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
