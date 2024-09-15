import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies/models/api_manager.dart';
import 'package:movies/models/popular_model/Popular_model.dart';
import 'package:movies/models/top_rated_model/Results.dart';
import 'package:movies/models/top_rated_model/Top_rated.dart';
import 'package:movies/models/upcoming_model/Results.dart';
import 'package:movies/ui/constants.dart';
import '../../models/popular_model/Results.dart';
import '../../models/upcoming_model/Upcoming.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widget.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isClicked = false ;


  @override
  Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor: Colors.black,
  body: SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          const Text('Popular',style: TextStyle(color: Colors.white,fontSize: 25),),
      FutureBuilder<PopularModel> (
      future:  ApiManager.getTopMovies(),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            return ErrorView(
                error: snapshot.error.toString(), onRetryClick: () {});
          } else if (snapshot.hasData) {
            return buildTopMoviesList(snapshot.data!.results!);
          } else {
            return LoadingView();

          }
        }
    ),
      const SizedBox(height: 20,),
         const Text('New Releases',style: TextStyle(color: Colors.white,fontSize: 25),),
         const SizedBox(height: 20,),
          FutureBuilder<Upcoming> (
              future:  ApiManager.getNewReleases(),
              builder: (context,snapshot) {
                if (snapshot.hasError) {
                  return ErrorView(
                      error: snapshot.error.toString(), onRetryClick: () {});
                } else if (snapshot.hasData) {
                  return  buildNewReleasesList(snapshot.data!.results!);

                } else {
                  return LoadingView();

                }
              }
          ),
         const SizedBox(height: 20,),
         const Text('Recommended',style: TextStyle(color: Colors.white,fontSize: 25),),
         const SizedBox(height: 20,),
          FutureBuilder<TopRated> (
              future:  ApiManager.getNewRecommended(),
              builder: (context,snapshot) {
                if (snapshot.hasError) {
                  return ErrorView(
                      error: snapshot.error.toString(), onRetryClick: () {});
                } else if (snapshot.hasData) {
                  return buildRecommendedList(snapshot.data!.results!);

                } else {
                  return LoadingView();

                }
              }
          ),
        ],
      ),
    ),
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

  mapUpcomingWidget(BuildContext context,UpcomingResults upComingResults) {
      return InkWell(
        onTap: (){
          setState(() {
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 3),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: "${Constants.imagePath}/${upComingResults.posterPath}" ?? "",
                placeholder: (context, url) => LoadingView(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: MediaQuery.of(context).size.height * .25,
              ),
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
            CachedNetworkImage(
              imageUrl: "${Constants.imagePath}/${topRatedResults.posterPath}" ?? "",
              placeholder: (context, url) => LoadingView(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: MediaQuery.of(context).size.height * .25,
            ),
          ],
        ),
      ),
    );
  }


  mapPopularWidget(BuildContext context,PopularResults popularResults) {
    if(isClicked == false){
      return InkWell(
        onTap: (){
          isClicked = !isClicked ;
          setState(() {

          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 3),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: "${Constants.imagePath}/${popularResults.posterPath}" ?? "",
                placeholder: (context, url) => LoadingView(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: MediaQuery.of(context).size.height * .25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(popularResults.title ?? "" ,
                    style: TextStyle(fontSize: 15,color: Colors.grey),),
                  const SizedBox(width: 20,),
                ],
              ),
              Text(popularResults.releaseDate ?? "",
                style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600 ,color: Colors.black),),
              const SizedBox(width: 200,),
            ],
          ),
        ),
      );
    }
    else if(isClicked == true){
      return InkWell(
        onTap: (){
          isClicked = !isClicked ;
          setState(() {

          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 3),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: "${Constants.imagePath}/${popularResults.posterPath}" ?? "",
                placeholder: (context, url) => LoadingView(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: MediaQuery.of(context).size.height * .25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(popularResults.title ?? "",style: TextStyle(fontSize: 15,color: Colors.grey),),
                  const SizedBox(width: 20,),
                ],
              ),
              Text(popularResults.releaseDate ?? "",
                style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600 ,color: Colors.black),),

              Text(popularResults.overview ?? ""),
            ],
          ),
        ),
      );
    }
  }


}
