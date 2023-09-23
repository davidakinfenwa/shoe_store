// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shoe_store/features/core/util/constants.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    Key? key,
    required this.buttonColor,
    required this.label,
  }) : super(key: key);
  final Color buttonColor;
  final String label;
 
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        height: Sizing.kHSpacing40,
        width: MediaQuery.sizeOf(context).width * 0.23,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: buttonColor, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 20, color: buttonColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
