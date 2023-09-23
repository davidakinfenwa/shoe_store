import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shoe_store/features/presentation/shared/stagger_tile.dart';

import '../../data/model/shoe_model.dart';

class SeeAllShoeSession extends StatelessWidget {
  const SeeAllShoeSession({
    super.key,
    required Future<List<Sneakers>> maleSneaker,
  }) : _maleSneaker = maleSneaker;

  final Future<List<Sneakers>> _maleSneaker;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
        future: _maleSneaker,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final male = snapshot.data;
            return MasonryGridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: male!.length,
                
                itemBuilder: (context, index) {
                  final shoe = snapshot.data![index];
                  return StaggerTile(
                      image: shoe.imageUrl[1],
                      name: shoe.name,
                      price: shoe.price);
                });
          }
        });
  }
}
