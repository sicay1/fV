import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:videoplayer1/Models/TMDB_model.dart';

class VideoData with ChangeNotifier {
  final String url = 'https://api.themoviedb.org/3/trending/all/day?api_key=d70ebc452ad1efbcd282acb3e931bdf0';

  var videoData = new TMDBModel();

  Future fetchData() async {
    var resp = await Dio().get(url);
    videoData =  TMDBModel.fromJson(resp.data);
    notifyListeners();
  }
}
