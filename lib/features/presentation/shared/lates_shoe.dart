// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/theme/custom_typography.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:
            MediaQuery.sizeOf(context).height *
                0.12,
        width: MediaQuery.sizeOf(context).width *
            0.28,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(16)),
            color:
                CustomTypography.kBackgroundColor,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 0.8,
                  color: CustomTypography
                      .kWhiteColor,
                  spreadRadius: 0.5,
                  offset: Offset(0, 1))
            ]),
        child: CachedNetworkImage(
          imageUrl:
              imageUrl,
        ),
      ),
    );
  }
}
