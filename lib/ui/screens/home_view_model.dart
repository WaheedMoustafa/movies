import 'package:flutter/cupertino.dart';
import 'package:movies/models/popular_model/Results.dart';
import 'package:movies/models/top_rated_model/Top_rated.dart';
import 'package:movies/models/upcoming_model/Upcoming.dart';
import '../../models/api_manager.dart';
import '../../models/base.dart';
import '../../models/top_rated_model/Results.dart';
import '../../models/upcoming_model/Results.dart';

class TopMoviesViewModel extends ChangeNotifier {
  BaseApiState popularApiState = BaseLoadingState();

  getTopMovies() async {
    try {
        popularApiState = BaseLoadingState();
        notifyListeners();

      List<PopularResults> topMovies = (await ApiManager.getTopMovies()).results!;


      popularApiState = BaseSuccessState(topMovies);
      notifyListeners();

    } catch (e) {
      popularApiState = BaseErrorState(e.toString());
      notifyListeners();
    }
  }
}

class UpcomingViewModel extends ChangeNotifier {
  BaseApiState upcomingApiState = BaseLoadingState();

  getNewReleases() async {
    try {
      upcomingApiState = BaseLoadingState();
      notifyListeners();

      List<UpcomingResults> upcomingMovies = (await ApiManager.getNewReleases()).results!;


      upcomingApiState = BaseSuccessState(upcomingMovies);
      notifyListeners();

    } catch (e) {
      upcomingApiState = BaseErrorState(e.toString());
      notifyListeners();
    }
  }
}

class TopRatedViewModel extends ChangeNotifier {
  BaseApiState topRatedApiState = BaseLoadingState();

  getNewRecommended() async {
    try {
      topRatedApiState = BaseLoadingState();
      notifyListeners();

      List<TopRatedResults> topRatedMovies = (await ApiManager.getNewRecommended()).results!;


      topRatedApiState = BaseSuccessState(topRatedMovies);
      notifyListeners();

    } catch (e) {
      topRatedApiState = BaseErrorState(e.toString());
      notifyListeners();
    }
  }
}