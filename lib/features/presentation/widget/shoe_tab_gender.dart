// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shoe_store/features/presentation/screens/extrascreen/product_by_cat.dart';
import 'package:shoe_store/features/presentation/screens/extrascreen/product_detail_page.dart';

import '../../core/theme/custom_typography.dart';
import '../../core/util/constants.dart';
import '../../data/model/shoe_model.dart';
import '../shared/lates_shoe.dart';
import '../shared/product_card.dart';

class ShoeTab extends StatelessWidget {
  ShoeTab({
    Key? key,
    required Future<List<Sneakers>> maleSneaker,
    required this.tabIndex,
  
  }) : _maleSneaker = maleSneaker;

  late final Future<List<Sneakers>> _maleSneaker;
  final int tabIndex;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.405.h,
            child: FutureBuilder<List<Sneakers>>(
                future: _maleSneaker,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: male!.length,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return GestureDetector(
                            //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetail(id: shoe.id, category: shoe.category))),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetail(id: shoe.id, category: shoe.category))));
                            },
                            child: ProductCard(
                                name: shoe.name,
                                category: shoe.category,
                                price: "\$${shoe.price}",
                                id: shoe.id,
                                image: shoe.imageUrl[0]),
                          );
                        });
                  }
                })),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest Shoes',
                    style: TextStyle(
                        fontSize: Sizing.kSizingMultiple * 2.5,
                        color: CustomTypography.kBlackColor,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    
                    onTap: () {
                      //print(tabIndex);
                      Navigator.push(context,MaterialPageRoute(
                        builder: (context) =>  ProductByCart(
                              tabIndex: tabIndex,
                            )));},
                    child: const Row(
                      children: [
                        Text(
                          "Show All",
                          style: TextStyle(
                              fontSize: Sizing.kSizingMultiple * 2,
                              color: CustomTypography.kBlackColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(Icons.arrow_right_alt_sharp)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: FutureBuilder<List<Sneakers>>(
                future: _maleSneaker,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: male!.length,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return LatestShoes(
                            imageUrl: shoe.imageUrl[1],
                          );
                        });
                  }
                }),
          ),
        )
      ],
    );
  }
}
