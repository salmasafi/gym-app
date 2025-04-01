import 'package:flutter/material.dart';
import 'package:gym_app/Widgets/widgets_profile_body/profile_edit_body.dart';


class ProfileEdit  extends StatelessWidget {
  const ProfileEdit ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ProfileEditBody(),
    );
  }
}
