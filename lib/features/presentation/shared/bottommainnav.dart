import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/features/presentation/controllers/tabscreen_provider.dart';

import '../../core/theme/custom_typography.dart';
import '../../core/util/constants.dart';
import '../widget/bottomnav_widget.dart';

class BottomMainNav extends StatelessWidget {
  const BottomMainNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenNotifier>(builder: ((context, value, child) {
      return SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Sizing.kSizingMultiple * 2.w),
        child: Container(
          height: Sizing.kSizingMultiple * 6.5.h,
          width: Sizing.kSizingMultiple * 6.w,
          padding:
              EdgeInsets.symmetric(horizontal: Sizing.kSizingMultiple * 2.w),
          decoration: BoxDecoration(
              color: CustomTypography.kBlackColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kSizingMultiple * 2.w))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BottomNavWidget(
                onTap: () {
                  value.pageIndex = 0;
                },
                iconData: value.pageIndex == 0
                    ? Icons.home_filled
                    : Icons.home_outlined),
            BottomNavWidget(
                onTap: () {
                  value.pageIndex = 1;
                },
                iconData: value.pageIndex == 1
                    ? Icons.search
                    : Icons.search_outlined),
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 2;
              },
              iconData: value.pageIndex == 2
                  ? Icons.add_circle_outlined
                  : Icons.add_circle_outline,
            ),
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 3;
              },
              iconData: value.pageIndex == 3
                  ? Icons.add_shopping_cart
                  : Icons.add_shopping_cart_outlined,
            ),
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 4;
              },
              iconData: value.pageIndex == 4
                  ? Icons.person_2_rounded
                  : Icons.person_2_outlined,
            ),
          ]),
        ),
      ));
    }));
  }
}
