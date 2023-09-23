// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shoe_store/features/presentation/shared/category_btn.dart';
import 'package:shoe_store/features/presentation/shared/custom_spacer.dart';

import '../../../core/theme/custom_typography.dart';
import '../../../core/util/constants.dart';
import '../../../data/model/shoe_model.dart';
import '../../../data/source/helper.dart';
import '../../shared/see_all_shoe_session.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({
    Key? key,
    required this.tabIndex,
  }) : super(key: key);

  final int tabIndex;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
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
    widget.tabIndex;
    getMale();
    getFemale();
    getKids();
    super.initState();
  }

  List<String> brand = [
    "assets/items/1.png",
    "assets/items/2.png",
    "assets/items/3.png",
    "assets/items/4.png"
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.tabIndex);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height.h,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4.h,
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/items/bg.jpg'),
                      fit: BoxFit.fill)),
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                CommunityMaterialIcons.close,
                                color: CustomTypography.kWhiteColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                filter();
                              },
                              child: const Icon(
                                FontAwesomeIcons.sliders,
                                color: CustomTypography.kWhiteColor,
                              ),
                            ),
                          ],
                        ),
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
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.2),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SeeAllShoeSession(maleSneaker: _maleSneaker),
                      SeeAllShoeSession(maleSneaker: _femaleSneaker),
                      SeeAllShoeSession(maleSneaker: _kidSneaker),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        context: context,
        builder: (context) => Container(
              height: MediaQuery.sizeOf(context).height * 0.82,
              decoration: const BoxDecoration(
                color: CustomTypography.kWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black38),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.78,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomSpacer(),
                        const Text(
                          "Filter",
                          style: TextStyle(
                              fontSize: 40,
                              color: CustomTypography.kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const CustomSpacer(),
                        const Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 20,
                              color: CustomTypography.kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CategoryBtn(
                                buttonColor: Colors.black, label: "Men"),
                            CategoryBtn(
                                buttonColor: Colors.grey, label: "Women"),
                            CategoryBtn(
                                buttonColor: Colors.grey, label: "Kids"),
                          ],
                        ),
                        const CustomSpacer(),
                        const Text(
                          "Categoty",
                          style: TextStyle(
                              fontSize: 20,
                              color: CustomTypography.kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CategoryBtn(
                                buttonColor: Colors.black, label: "Shoes"),
                            CategoryBtn(
                                buttonColor: Colors.grey, label: "Clothe"),
                            CategoryBtn(
                                buttonColor: Colors.grey, label: "Watches"),
                          ],
                        ),
                        const CustomSpacer(),
                        const Text(
                          "Price",
                          style: TextStyle(
                              fontSize: 20,
                              color: CustomTypography.kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomSpacer(),
                        Slider(
                            activeColor: CustomTypography.kBlackColor,
                            inactiveColor: CustomTypography.kGreyColor,
                            thumbColor: Colors.black,
                            max: 500,
                            divisions: 50,
                            label: _value.toString(),
                            secondaryTrackValue: 200.h,
                            value: _value,
                            onChanged: (double value) {}),
                        const CustomSpacer(),
                        Text(
                          "Brand",
                          style: TextStyle(
                              fontSize: 20.h,
                              color: CustomTypography.kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(8.h),
                          height: Sizing.kHSpacing40 * 2.h,
                          child: ListView.builder(
                              itemCount: brand.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final shoe = brand[index];
                                return Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Image.asset(
                                      shoe,
                                      height: Sizing.kHSpacing20 * 3.5.h,
                                      width: Sizing.kWSpacing20 * 3.5.w,
                                      color: Colors.black45,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
