// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shoe_store/features/core/theme/custom_typography.dart';

import '../../core/util/constants.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile({
    Key? key,
    required this.image,
    required this.name,
    required this.price
  }) : super(key: key);
  final String image;
  final String name;
  final String price;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          color: CustomTypography.kWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.image,
              fit: BoxFit.fill,
            ),
            Container(
              height: 70,
              padding:const EdgeInsets.only(top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style:const TextStyle(
                        fontSize: Sizing.kSizingMultiple * 2,
                        color: CustomTypography.kBlackColor,
                        fontWeight: FontWeight.w700,height: 1),
                  ),
                   Text(
                    " \$${widget.price}",
                    style:const TextStyle(
                        fontSize: Sizing.kSizingMultiple * 2, height: 1,
                        color: CustomTypography.kBlackColor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
