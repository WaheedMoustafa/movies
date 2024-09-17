import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/top_rated_model/Results.dart';
import 'package:movies/models/upcoming_model/Results.dart';
import 'package:movies/ui/constants.dart';
import 'package:movies/ui/screens/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../models/base.dart';
import '../../models/popular_model/Results.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widget.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TopMoviesViewModel topMoviesViewModel = TopMoviesViewModel();
  UpcomingViewModel upcomingViewModel = UpcomingViewModel();
  TopRatedViewModel topRatedViewModel = TopRatedViewModel() ;

  bool isClicked = false ;


  @override
  void initState() {
    super.initState();
    topMoviesViewModel.getTopMovies();
    upcomingViewModel.getNewReleases();
    topRatedViewModel.getNewRecommended();

  }

  @override
  Widget build(BuildContext context) {

  return SafeArea(
    child: Column(
      children: [
        ChangeNotifierProvider(
          create: (_) => topMoviesViewModel,
          builder: (context ,_) {
            topMoviesViewModel = Provider.of(context);
            if (topMoviesViewModel.popularApiState is BaseLoadingState) {
              return const LoadingView();
            } else if (topMoviesViewModel.popularApiState is BaseErrorState) {
              String errorMessage =
                  (topMoviesViewModel.popularApiState as BaseErrorState).errorMessage;
              return ErrorView(error: errorMessage, onRetryClick: () {});
            }
            else {
              List<PopularResults> topMovies =
                  (topMoviesViewModel.popularApiState as BaseSuccessState<List<PopularResults>>)
                      .data;
              return buildTopMoviesList(topMovies);
            }

          },

        ),

        ChangeNotifierProvider(
          create: (_) => upcomingViewModel,
          builder: (context ,_) {
            upcomingViewModel = Provider.of(context);
            if (upcomingViewModel.upcomingApiState is BaseLoadingState) {
              return const LoadingView();
            } else if (upcomingViewModel.upcomingApiState is BaseErrorState) {
              String errorMessage =
                  (upcomingViewModel.upcomingApiState as BaseErrorState).errorMessage;
              return ErrorView(error: errorMessage, onRetryClick: () {});
            }
            else {
              List<UpcomingResults> newReleasesMovies =
                  (upcomingViewModel.upcomingApiState as BaseSuccessState<List<UpcomingResults>>)
                      .data;
              return buildNewReleasesList(newReleasesMovies);
            }

          },

        ),

        ChangeNotifierProvider(
          create: (_) => topRatedViewModel,
          builder: (context ,_) {
            topRatedViewModel = Provider.of(context);
            if (topRatedViewModel.topRatedApiState is BaseLoadingState) {
              return const LoadingView();
            } else if (topRatedViewModel.topRatedApiState is BaseErrorState) {
              String errorMessage =
                  (topRatedViewModel.topRatedApiState as BaseErrorState).errorMessage;
              return ErrorView(error: errorMessage, onRetryClick: () {});
            }
            else {
              List<TopRatedResults> topRatedMovies =
                  (topRatedViewModel.topRatedApiState as BaseSuccessState<List<TopRatedResults>>)
                      .data;
              return buildRecommendedList(topRatedMovies);
            }

          },

        ),
      ],
    ),
  );
  }


  Widget buildRecommendedList(List<TopRatedResults> list) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) =>
            mapTopRatedWidget(context, list[index]));
  }

  Widget buildNewReleasesList(List<UpcomingResults> list) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) =>
            mapUpcomingWidget(context, list[index]));
  }

  Widget buildTopMoviesList(List<PopularResults> list) {
    return
      CarouselSlider.builder(
        itemCount: list.length,
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return mapPopularWidget(context, list[itemIndex]);
        },

      );
  }

  mapUpcomingWidget(BuildContext context,UpcomingResults upComingResults ) {
      return InkWell(
        onTap: (){
          setState(() {
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 3),
          child: Column(
            children: [
              Container(
                child: Text(upComingResults.title ?? ""),
              ),
           //  CachedNetworkImage(
           //    imageUrl: "${Constants.imagePath}/${upComingResults.posterPath}" ?? "",
           //    placeholder: (context, url) => LoadingView(),
           //    errorWidget: (context, url, error) => Icon(Icons.error),
           //    height: MediaQuery.of(context).size.height * .25,
           //  ),
            ],
          ),
        ),
      );
    }

  mapTopRatedWidget(BuildContext context,TopRatedResults topRatedResults) {
    return InkWell(
      onTap: (){
        setState(() {
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 3),
        child: Column(
          children: [
            Container(
              child: Text(topRatedResults.title ?? ""),
            ),
        //    CachedNetworkImage(
        //      imageUrl: "${Constants.imagePath}/${topRatedResults.posterPath}" ?? "",
        //      placeholder: (context, url) => LoadingView(),
        //      errorWidget: (context, url, error) => Icon(Icons.error),
        //      height: MediaQuery.of(context).size.height * .25,
        //    ),
          ],
        ),
      ),
    );
  }


  mapPopularWidget(BuildContext context, PopularResults popularResults) {
      return InkWell(
        onTap: (){
          setState(() {

          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 3),
          child: Stack(
            children : [
            //  CachedNetworkImage(
            //    imageUrl: "${Constants.imagePath}/${popularResults.posterPath}" ?? "",
            //    placeholder: (context, url) => const LoadingView(),
            //    errorWidget: (context, url, error) => const Icon(Icons.error),
            //    height: MediaQuery.of(context).size.height * .50,
            //  ),
              Column(
              children: [
            //  CachedNetworkImage(
            //    imageUrl: "${Constants.imagePath}/${popularResults.posterPath}" ?? "",
            //    placeholder: (context, url) => const LoadingView(),
            //    errorWidget: (context, url, error) => const Icon(Icons.error),
            //    height: MediaQuery.of(context).size.height * .25,
            //  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(popularResults.title ?? "" ,
                      style: const TextStyle(fontSize: 15,color: Colors.grey),),
                    const SizedBox(width: 20,),
                  ],
                ),
                Text(popularResults.releaseDate ?? "",
                  style: const TextStyle(fontSize: 20,fontWeight:FontWeight.w600 ,color: Colors.black),),
                const SizedBox(width: 200,),
              ],
            ),],
          ),
        ),
      );

  }


}
