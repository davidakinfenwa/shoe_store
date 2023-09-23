import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/features/presentation/controllers/product_detail_provider.dart';
import 'package:shoe_store/features/presentation/controllers/tabscreen_provider.dart';
import 'package:shoe_store/features/presentation/screens/tabscreen.dart';

import 'features/core/theme/custom_typography.dart';

void main() {
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context)=>TabScreenNotifier()),
      ChangeNotifierProvider(create: (context)=>ProductDetailNotifier()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 772),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return KeyboardVisibilityProvider(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
             theme: CustomTypography.themeDataModifications,
              home: const TabScreen(),
            ),
          );
        });
  }
}
