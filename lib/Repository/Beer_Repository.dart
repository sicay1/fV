import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:videoplayer1/Models/Beer_model.dart';

Future<List<BeerModel>> getBeers() async{
  BeerListModel blm;
  final String url = GlobalConfiguration().getString("beer_api_url");
  var jsonData = await Dio().get(url);
  var dddd = jsonData.data;
  
  // var eeee = jsonDecode(dddd);
  blm =  BeerListModel.fromJson(dddd);
  // List<BeerModel> aaa = dddd.map((Map model) => BeerModel.fromJson(model)).toList();
  return blm.beerList;
  // (jsonDecode(jsonData.data).toIterable());
  // .fromJson(jsonData.data);
}