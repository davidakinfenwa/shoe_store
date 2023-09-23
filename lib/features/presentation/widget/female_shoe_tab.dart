
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/custom_typography.dart';
import '../../core/util/constants.dart';
import '../../data/model/shoe_model.dart';
import '../shared/lates_shoe.dart';
import '../shared/product_card.dart';

class FemaleShoeTab extends StatelessWidget {
   // ignore: prefer_const_constructors_in_immutables
   FemaleShoeTab({
    super.key,
    required Future<List<Sneakers>> femaleSneaker,
    required this.context,
  }) : _femaleSneaker = femaleSneaker;

  late final Future<List<Sneakers>> _femaleSneaker;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.405.h,
            child: FutureBuilder<List<Sneakers>>(
                future: _femaleSneaker,
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
                          return ProductCard(
                              name: shoe.name,
                              category: shoe.category,
                              price: "\$${shoe.price}",
                              id: shoe.id,
                              image: shoe.imageUrl[0]);
                        });
                  }
                })),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoes',
                    style: TextStyle(
                        fontSize: Sizing.kSizingMultiple * 2.5,
                        color: CustomTypography.kBlackColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
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
                  )
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child:  FutureBuilder<List<Sneakers>>(
                future: _femaleSneaker,
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
                          return LatestShoes(imageUrl: shoe.imageUrl[1],);
                        });
                  }
                }),
          ),
        )
      ],
    );
  }
}
