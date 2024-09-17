import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/popular_model/Results.dart';
import '../../models/api_manager.dart';
import '../../models/search_model/search_response.dart';
import '../../widgets/loading_widget.dart';
import '../constants.dart';


//  class SearchScreen extends StatefulWidget {
//    const SearchScreen({super.key});
//    static const String routeName = 'search';
//
//    @override
//    State<SearchScreen> createState() => _SearchScreenState();
//  }
//
//  class _SearchScreenState extends State<SearchScreen> {
//    bool isClicked = false;
//    TextEditingController searchController = TextEditingController();
//
//    Future<void> getSearchedMovies(String query) async {
//      try {
//        SearchResponse searchResponse = await ApiManager.getSearch(query);
//        if (searchResponse.results != null) {
//          setState(() {
//            resultsList = searchResponse.results!;
//          });
//        } else {
//          // Handle the case where articles are null
//          setState(() {
//            resultsList = [];
//          });
//        }
//      } catch (error) {
//        // Handle any errors that occur during the fetch
//        print('Error fetching searched news: $error');
//        setState(() {
//          resultsList = [];
//        });
//      }
//    }
//
//    getSearchedNews(String query) async {
//      SearchResponse searchResponse = await ApiManager.getSearch(query);
//      resultsList = searchResponse.results!;
//      setState(() {});
//      return searchResponse.results;
//    }
//
//    List<dynamic> resultsList = [];
//
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        body: SafeArea(
//          child: Column(
//            children: [
//              const SizedBox(
//                height: 8,
//              ),
//              Row(
//                children: [
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: IconButton(
//                        onPressed: () {
//                          Navigator.pop(context);
//                        },
//                        icon: const Icon(Icons.arrow_back)),
//                  ),
//                  Expanded(
//                    child: TextField(
//                      controller: searchController,
//                      onChanged: (value) {},
//                      onSubmitted: (value) {
//                        getSearchedNews(searchController.text);
//                      },
//                      decoration: InputDecoration(
//                          hintText: "Search",
//                          suffixIcon: IconButton(
//                            onPressed: () {
//                              getSearchedNews(searchController.text);
//                            },
//                            icon: const Opacity(
//                              opacity: .8,
//                              child: Icon(
//                                Icons.search,
//                                size: 28,
//                              ),
//                            ),
//                          ),
//                          enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(12),
//                              borderSide: const BorderSide(color: Colors.white)),
//                          focusedBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(12),
//                              borderSide: const BorderSide(color: Colors.white))),
//                    ),
//                  ),
//                ],
//              ),
//              const SizedBox(
//                height: 16,
//              ),
//              Expanded(
//                  child: resultsList.isEmpty
//                      ? Container()
//                      : Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 12),
//                    child: ListView.builder(
//                      itemCount: resultsList.length,
//                      itemBuilder: (context, index) =>
//                          mapArticleSearchMoviesWidget(context,resultsList[index]),
//                    ),
//                  ))
//            ],
//          ),
//        ),
//      );
//    }
//
//    mapArticleSearchMoviesWidget(BuildContext context,PopularResults searchedResults) {
//      return InkWell(
//        onTap: (){
//          setState(() {
//          });
//        },
//        child: Container(
//          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 3),
//          child: Column(
//            children: [
//              CachedNetworkImage(
//                imageUrl: "${Constants.imagePath}/${searchedResults.posterPath}" ?? "",
//                placeholder: (context, url) => LoadingView(),
//                errorWidget: (context, url, error) => Icon(Icons.error),
//                height: MediaQuery.of(context).size.height * .25,
//              ),
//            ],
//          ),
//        ),
//      );
//    }
//
//
//  }
//