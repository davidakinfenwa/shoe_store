// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'package:shoe_store/features/core/theme/custom_typography.dart';
import 'package:shoe_store/features/core/util/constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.name,
    required this.category,
    required this.price,
    required this.id,
    required this.image,
  }) : super(key: key);
  final String name;
  final String category;
  final String price;
  final String id;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width * 0.6,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 0.8,
                color: CustomTypography.kWhiteColor,
                spreadRadius: 0.8,
                offset: Offset(1, 0.6)),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.image,
                    imageBuilder: (context, imageProvider) => Container(
                      height: MediaQuery.sizeOf(context).height * 0.23,
                      decoration: BoxDecoration(
                          image:
                              DecorationImage(image: imageProvider)),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: null,
                        child: const Icon(CommunityMaterialIcons.heart_outline),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: Sizing.kSizingMultiple),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: Sizing.kSizingMultiple * 4,
                          color: CustomTypography.kBlackColor,
                          fontWeight: FontWeight.bold,
                          height: 1.1),
                    ),
                    Text(
                      widget.category,
                      style:  TextStyle(
                          fontSize: Sizing.kSizingMultiple * 2,
                          color: CustomTypography.kMidGreyColor,
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Sizing.kSizingMultiple,
                    right: Sizing.kSizingMultiple),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                          fontSize: Sizing.kSizingMultiple * 3,
                          color: CustomTypography.kBlackColor,
                          fontWeight: FontWeight.bold,
                          height: 1.1),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Color",
                          style: TextStyle(
                              fontSize: Sizing.kSizingMultiple * 2,
                              color: CustomTypography.kGreyColor,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          shape: CircleBorder(),
                          label: const Text(""),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: CustomTypography.kBlackColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
