import 'dart:convert';
import 'package:movies/models/popular_model/Popular_model.dart';
import 'package:movies/models/search_model/search_response.dart';
import 'package:movies/models/top_rated_model/Top_rated.dart';
import 'package:movies/models/upcoming_model/Upcoming.dart';
import 'package:movies/ui/constants.dart';
import 'package:http/http.dart' as http;

abstract class ApiManager {

  static const String _popularBaseUrl  =  'https://api.themoviedb.org/3/movie/popular';
  static const String _upcomingBaseUrl  = 'https://api.themoviedb.org/3/movie/upcoming';
  static const String _topRatedBaseUrl  = 'https://api.themoviedb.org/3/movie/top_rated';
  static const String _detailsUrl = 'https://api.themoviedb.org/3/movie';
  static const String _likeThisUrl = 'https://api.themoviedb.org/3/movie';
  static const String _searchUrl = 'https://api.themoviedb.org/3/search/movie';


  static Future<PopularModel> getTopMovies () async{
    try{
    http.Response response = await http.get(Uri.parse('$_popularBaseUrl?day?apiKey=${Constants.apiKey}'));
    print('$response');
    if(response.statusCode >= 200 && response.statusCode < 300){
      Map json = jsonDecode(response.body) as Map;
      return PopularModel.fromJson(json);

    }
    return PopularModel();
    }
      catch(e){
         throw e.toString();
        }

  }


  static Future<Upcoming> getNewReleases () async{
    try {
      http.Response response = await http.get(
          Uri.parse('$_upcomingBaseUrl?apiKey=${Constants.apiKey}'));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map json = jsonDecode(response.body) as Map;
        return Upcoming.fromJson(json);
      }
      return Upcoming();
    }
    catch(e){
      throw e.toString();
    }

  }

  static Future<TopRated> getNewRecommended () async{
    try {
      http.Response response = await http.get(
          Uri.parse('$_topRatedBaseUrl?apiKey=${Constants.apiKey}'));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map json = jsonDecode(response.body) as Map;
        return TopRated.fromJson(json);
      }
      return TopRated();
    }
    catch(e){
      throw e.toString();
    }

  }




  static Future<PopularModel> getDetails (String movieId) async{
    final response = await http.get(Uri.parse('$_detailsUrl/$movieId?apiKey=${Constants.apiKey}'));
    if(response.statusCode >= 200 && response.statusCode < 300){
      Map json = jsonDecode(response.body) as Map;
      return PopularModel.fromJson(json);
    } else{
      throw 'Something Went Wrong';
    }

  }

  static Future<PopularModel> getLikeThis (String movieId) async{

      final response = await http.get(Uri.parse(
          '$_likeThisUrl/$movieId/similar?apiKey=${Constants.apiKey}'));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map json = jsonDecode(response.body) as Map;
        return PopularModel.fromJson(json);
      } else {
        throw 'Something Went Wrong';
      }

  }

// static Future<SearchResponse> getSearch (String query) async{
//   http.Response response = await http.get(Uri.parse('$_searchUrl?apiKey=${Constants.apiKey}&q=$query'));
//   if(response.statusCode >= 200 && response.statusCode < 300){
//     Map json = jsonDecode(response.body) as Map;
//     return SearchResponse.fromJson(json);
//   } else{
//     throw 'Something Went Wrong';
//   }

// }


}

