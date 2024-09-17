// import 'dart:convert';
// /// page : 1
// /// results : []
// /// total_pages : 1
// /// total_results : 0
//
// SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));
// String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());
// class SearchResponse {
//   SearchResponse({
//       num? page,
//       List<dynamic>? results,
//       num? totalPages,
//       num? totalResults,}){
//     _page = page;
//     _results = results;
//     _totalPages = totalPages;
//     _totalResults = totalResults;
// }
//
//  SearchResponse.fromJson(dynamic json) {
//    _page = json['page'];
//    if (json['results'] != null) {
//      _results = [];
//      json['results'].forEach((v) {
//        _results?.add(Dynamic.fromJson(v));
//      });
//    }
//    _totalPages = json['total_pages'];
//    _totalResults = json['total_results'];
//  }
//   num? _page;
//   List<dynamic>? _results;
//   num? _totalPages;
//   num? _totalResults;
// SearchResponse copyWith({  num? page,
//   List<dynamic>? results,
//   num? totalPages,
//   num? totalResults,
// }) => SearchResponse(  page: page ?? _page,
//   results: results ?? _results,
//   totalPages: totalPages ?? _totalPages,
//   totalResults: totalResults ?? _totalResults,
// );
//   num? get page => _page;
//   List<dynamic>? get results => _results;
//   num? get totalPages => _totalPages;
//   num? get totalResults => _totalResults;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['page'] = _page;
//     if (_results != null) {
//       map['results'] = _results?.map((v) => v.toJson()).toList();
//     }
//     map['total_pages'] = _totalPages;
//     map['total_results'] = _totalResults;
//     return map;
//   }
//
// }