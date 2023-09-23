// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:shoe_store/features/core/theme/custom_typography.dart';
import 'package:shoe_store/features/data/source/helper.dart';
import 'package:shoe_store/features/presentation/controllers/product_detail_provider.dart';

import '../../../data/model/shoe_model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    required this.id,
    required this.category,
  }) : super(key: key);
  final String id;
  final String category;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Future<Sneakers> _sneakers;

  void getShoeDetail() {
    if (widget.category == "Men Shoes") {
      _sneakers = Helper().getMaleSneakersID(widget.id);
    } else if (widget.category == "Women Shoes") {
      _sneakers = Helper().getFemaleSneakersID(widget.id);
    } else if (widget.category == "kids Shoes") {
      _sneakers = Helper().getKidSneakersID(widget.id);
    }
  }

  @override
  void initState() {
    getShoeDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      body: FutureBuilder<Sneakers>(
          future: _sneakers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            } else {
              final sneakers = snapshot.data;
              return Consumer<ProductDetailNotifier>(
                  builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                FontAwesomeIcons.xmark,
                                color: CustomTypography.kBlackColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: const Icon(FontAwesomeIcons.ellipsis,
                                  color: CustomTypography.kBlackColor),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: CustomTypography.kTransparentColor,
                      expandedHeight: MediaQuery.sizeOf(context).height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              width: MediaQuery.sizeOf(context).width,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sneakers!.imageUrl.length,
                                  controller: pageController,
                                  onPageChanged: (page) {
                                    productNotifier.activeProduct = page;
                                  },
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.39,
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          color: Colors.grey.shade700,
                                          child: CachedNetworkImage(
                                            imageUrl: sneakers.imageUrl[index],
                                            fit: BoxFit.contain,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.70,
                                          ),
                                        ),
                                        Positioned(
                                            top: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.1,
                                            right: 20,
                                            child: const Icon(
                                              FontAwesomeIcons.heart,
                                              color: Colors.grey,
                                            )),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List<Widget>.generate(
                                                  sneakers.imageUrl.length,
                                                  (index) => Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    4.h),
                                                        child: CircleAvatar(
                                                          radius: 5,
                                                          backgroundColor:
                                                              productNotifier
                                                                          .activeproduct ==
                                                                      index
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                        ),
                                                      )),
                                            )),
                                        Positioned(
                                          bottom: 200,
                                            child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),),
                                              child: Container(
                                                height:MediaQuery.sizeOf(context).height*0.645 ,
                                                width: MediaQuery.sizeOf(context).width,
                                                color: Colors.white,
                                                child:Padding(padding: EdgeInsets.all(12),child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(sneakers.name,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
                                                  ],
                                                ),) ,
                                              ),
                                        ),
                                        )
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              });
            }
          }),
    );
  }
}
