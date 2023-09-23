import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_store/features/core/theme/custom_typography.dart';
import 'package:shoe_store/features/core/util/constants.dart';
import 'package:shoe_store/features/data/model/shoe_model.dart';
import 'package:shoe_store/features/data/source/helper.dart';

import '../widget/shoe_tab_gender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _maleSneaker;
  late Future<List<Sneakers>> _femaleSneaker;
  late Future<List<Sneakers>> _kidSneaker;

  void getMale() {
    _maleSneaker = Helper().getMaleSneakers();
  }

  void getFemale() {
    _femaleSneaker = Helper().getWomenSneakers();
  }

  void getKids() {
    _kidSneaker = Helper().getMaleSneakers();
  }

  @override
  void initState() {
    getMale();
    getFemale();
    getKids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.sizeOf(context).width);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height.h,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4.h,
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              decoration: const BoxDecoration(
                  //color: CustomTypography.kBlackColor,
                  image: DecorationImage(
                      image: AssetImage('assets/items/bg.jpg'),
                      fit: BoxFit.fill)),
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Athletics Shoe",
                        style: TextStyle(
                            fontSize: Sizing.kSizingMultiple * 7,
                            color: CustomTypography.kWhiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Collections",
                        style: TextStyle(
                            fontSize: Sizing.kSizingMultiple * 7,
                            color: CustomTypography.kWhiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: CustomTypography.kTransparentColor,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: CustomTypography.kWhiteColor,
                          labelStyle: const TextStyle(
                              fontSize: Sizing.kSizingMultiple * 3,
                              color: CustomTypography.kWhiteColor,
                              fontWeight: FontWeight.bold),
                          unselectedLabelColor: CustomTypography.kGreyColor,
                          tabs: const [
                            Tab(
                              text: "Men Shoes",
                            ),
                            Tab(
                              text: "Women Shoes",
                            ),
                            Tab(
                              text: "Kids Shoes",
                            ),
                          ]),
                    ],
                  )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.3),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ShoeTab(
                      maleSneaker: _maleSneaker,
                      tabIndex: 0,
                    ),
                    ShoeTab(
                      maleSneaker: _femaleSneaker,
                      tabIndex: 1,
                    ),
                    ShoeTab(
                      maleSneaker: _kidSneaker,
                      tabIndex: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
