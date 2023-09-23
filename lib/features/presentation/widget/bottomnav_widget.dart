import 'package:flutter/material.dart';

import '../../core/theme/custom_typography.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key, this.onTap, required this.iconData,
  });
final void Function()? onTap ;
final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  SizedBox(
        child: Icon(
          iconData,
          color: CustomTypography.kWhiteColor,
        ),
      ),
    );
  }
}