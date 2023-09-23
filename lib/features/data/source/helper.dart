import 'package:flutter/services.dart' as the_bundles;
import 'package:shoe_store/features/data/model/shoe_model.dart';

//Helper will be used to retrive data from the json file since we are not using API
class Helper{
  Future<List<Sneakers>> getMaleSneakers () async{
    final result = await the_bundles.rootBundle.loadString("assets/json/men_shoe.json");

    final maleList = welcomeFromJson(result);
    return maleList;
  }

    Future<List<Sneakers>> getWomenSneakers () async{
    final result = await the_bundles.rootBundle.loadString("assets/json/female_shoe.json");

    final maleList = welcomeFromJson(result);
    return maleList;
  }

    Future<List<Sneakers>> getKidsSneakers () async{
    final result = await the_bundles.rootBundle.loadString("assets/json/men_shoe.json");

    final maleList = welcomeFromJson(result);
    return maleList;
  }


   Future<Sneakers> getMaleSneakersID (String id) async{
    final result = await the_bundles.rootBundle.loadString("assets/json/men_shoe.json");

    final maleList = welcomeFromJson(result);
    final sneakers= maleList.firstWhere((element) => element.id==id,);
    return sneakers;
  }

    Future<Sneakers> getFemaleSneakersID (String id) async{
    final result = await the_bundles.rootBundle.loadString("assets/json/female_shoe.json");

    final maleList = welcomeFromJson(result);
    final sneakers= maleList.firstWhere((element) => element.id==id,);
    return sneakers;
  }

    Future<Sneakers> getKidSneakersID (String id) async{
    final result = await the_bundles.rootBundle.loadString("assets/json/men_shoe.json");

    final maleList = welcomeFromJson(result);
    final sneakers= maleList.firstWhere((element) => element.id==id,);
    return sneakers;
  }
}