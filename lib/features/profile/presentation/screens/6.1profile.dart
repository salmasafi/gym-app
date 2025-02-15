import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SixdotOneProfileScreen extends StatelessWidget {
  const SixdotOneProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: ScreenUtil().setWidth(393),
          height:ScreenUtil().setHeight(852),
          child:Column(
            children: [
              Align(
                alignment:Alignment(0, 0) ,
                child:Container(
                  width: ScreenUtil().setWidth(393),
                  height:ScreenUtil().setHeight(289),
                  child: Align(
                    alignment: Alignment(132, 95),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/profile.png"),
                    ),
                  ),
                ) ,
              )
              
            ],
      
          ),
      ),
    );
    /*return const ScreenUtilInit(
      designSize: const Size(393,852),
      minTextAdapt: true,
      splitScreenMode: true,
    );*/
  }
}
