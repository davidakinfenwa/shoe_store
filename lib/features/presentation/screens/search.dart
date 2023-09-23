import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'This is the Search Screen',
          style: TextStyle(
              fontSize: Sizing.kSizingMultiple * 3.h,
              fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}