import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/features/presentation/controllers/tabscreen_provider.dart';
// import 'package:shoe_store/features/presentation/screens/addtocart.dart';
import 'package:shoe_store/features/presentation/screens/cart.dart';

import 'package:shoe_store/features/presentation/screens/home.dart';
import 'package:shoe_store/features/presentation/screens/profile.dart';
import 'package:shoe_store/features/presentation/screens/search.dart';

import '../shared/bottommainnav.dart';
import 'addtocart.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

List<Widget> pageList = [
  const HomeScreen(),
  const SearchScreen(),
  const AddToCart(),
  const CartScreen(),
  const ProfileScreen()
];

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenNotifier>(builder: ((context, value, child) {
      return Scaffold(
        body: pageList[value.pageIndex],
        bottomNavigationBar: const BottomMainNav(),
      );
    }));
  }
}
