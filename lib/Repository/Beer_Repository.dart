import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:videoplayer1/Models/Beer_model.dart';

Future<List<ListBeerModel>> getBeers() async{
  final String url = GlobalConfiguration().getString("beer_api_url");
  var jsonData = await Dio().get(url);
  return listBeerModelFromJson(jsonData.data);
}