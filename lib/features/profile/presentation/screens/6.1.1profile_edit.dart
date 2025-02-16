import 'package:flutter/material.dart';
import 'package:gym_app/features/profile/presentation/widgets/profile_edit_body.dart';

class ProfileEdit  extends StatelessWidget {
  const ProfileEdit ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileEditBody(),
    );
  }
}
