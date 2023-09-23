import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'This is the Cart Sreen',
          style: TextStyle(
              fontSize: Sizing.kSizingMultiple * 3.h,
              fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
