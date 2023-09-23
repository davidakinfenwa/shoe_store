import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'This is the Profile',
          style: TextStyle(
              fontSize: Sizing.kSizingMultiple * 3.h,
              fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}