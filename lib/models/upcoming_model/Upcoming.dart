import 'Dates.dart';
import 'Results.dart';
import 'dart:convert';

/// dates : {"maximum":"2024-10-09","minimum":"2024-09-18"}
/// page : 1
/// results : [{"adult":false,"backdrop_path":"/18wozP6NjPSNBSgCga5bN7yUSzl.jpg","genre_ids":[35,14,27],"id":917496,"original_language":"en","original_title":"Beetlejuice Beetlejuice","overview":"After a family tragedy, three generations of the Deetz family return home to Winter River. Still haunted by Beetlejuice, Lydia's life is turned upside down when her teenage daughter, Astrid, accidentally opens the portal to the Afterlife.","popularity":1434.036,"poster_path":"/kKgQzkUCnQmeTPkyIwHly2t6ZFI.jpg","release_date":"2024-09-04","title":"Beetlejuice Beetlejuice","video":false,"vote_average":7.226,"vote_count":416},{"adult":false,"backdrop_path":"/9BQqngPfwpeAfK7c2H3cwIFWIVR.jpg","genre_ids":[10749,18],"id":1079091,"original_language":"en","original_title":"It Ends with Us","overview":"When a woman's first love suddenly reenters her life, her relationship with a charming, but abusive neurosurgeon is upended, and she realizes she must learn to rely on her own strength to make an impossible choice for her future.","popularity":702.452,"poster_path":"/4TzwDWpLmb9bWJjlN3iBUdvgarw.jpg","release_date":"2024-08-07","title":"It Ends with Us","video":false,"vote_average":6.734,"vote_count":290},{"adult":false,"backdrop_path":"/p5kpFS0P3lIwzwzHBOULQovNWyj.jpg","genre_ids":[80,53],"id":1032823,"original_language":"en","original_title":"Trap","overview":"A father and teen daughter attend a pop concert, where they realize they're at the center of a dark and sinister event.","popularity":601.575,"poster_path":"/jwoaKYVqPgYemFpaANL941EF94R.jpg","release_date":"2024-07-31","title":"Trap","video":false,"vote_average":6.525,"vote_count":1024},{"adult":false,"backdrop_path":"/okVLmXL5y18dfN2R4ufMZEGaeCd.jpg","genre_ids":[28,80],"id":1160018,"original_language":"hi","original_title":"किल","overview":"When an army commando finds out his true love is engaged against her will, he boards a New Dehli-bound train in a daring quest to derail the arranged marriage. But when a gang of knife-wielding thieves begin to terrorize innocent passengers on his train, the commando takes them on himself in a death-defying kill-spree to save those around him — turning what should have been a typical commute into an adrenaline-fueled thrill ride.","popularity":613.07,"poster_path":"/m2zXTuNPkywdYLyWlVyJZW2QOJH.jpg","release_date":"2024-07-03","title":"Kill","video":false,"vote_average":6.791,"vote_count":134},{"adult":false,"backdrop_path":"/6ToGkmqn0KG0UGGGUAC1Ww0e5CM.jpg","genre_ids":[80,27,53],"id":1226578,"original_language":"en","original_title":"Longlegs","overview":"FBI Agent Lee Harker is assigned to an unsolved serial killer case that takes an unexpected turn, revealing evidence of the occult. Harker discovers a personal connection to the killer and must stop him before he strikes again.","popularity":583.698,"poster_path":"/5aj8vVGFwGVbQQs26ywhg4Zxk2L.jpg","release_date":"2024-05-31","title":"Longlegs","video":false,"vote_average":6.721,"vote_count":797},{"adult":false,"backdrop_path":"/jnrLpUtOKelKhmGieEBcAvrsrFB.jpg","genre_ids":[27,53],"id":1114513,"original_language":"en","original_title":"Speak No Evil","overview":"When an American family is invited to spend the weekend at the idyllic country estate of a charming British family they befriended on vacation, what begins as a dream holiday soon warps into a snarled psychological nightmare.","popularity":439.442,"poster_path":"/dA4N6uWOnEMgbxXwFX7qX7adzs8.jpg","release_date":"2024-09-11","title":"Speak No Evil","video":false,"vote_average":7.144,"vote_count":52},{"adult":false,"backdrop_path":"/yNU8UF3DOmv3G9gVNAj34beclTG.jpg","genre_ids":[16,878,12,28,10751],"id":698687,"original_language":"en","original_title":"Transformers One","overview":"The untold origin story of Optimus Prime and Megatron, better known as sworn enemies, but once were friends bonded like brothers who changed the fate of Cybertron forever.","popularity":429.209,"poster_path":"/iHPIBzrjJHbXeY9y7VVbEVNt7LW.jpg","release_date":"2024-09-11","title":"Transformers One","video":false,"vote_average":8.9,"vote_count":7},{"adult":false,"backdrop_path":"/orTQxcx2aoNpx1DIKTjBzpzvzd0.jpg","genre_ids":[27,14],"id":1130053,"original_language":"en","original_title":"Cinderella's Curse","overview":"Desperate Cinderella summons her fairy godmother from an ancient flesh-bound book, seeking revenge on her evil stepmother and stepsisters who abuse and torment her daily.","popularity":511.731,"poster_path":"/xegGyjYdCcF9X1FWpfw1O1LcFnZ.jpg","release_date":"2024-05-31","title":"Cinderella's Curse","video":false,"vote_average":4.6,"vote_count":19},{"adult":false,"backdrop_path":"/vJk9DOLgP23jO5mBnPHE93MFgYu.jpg","genre_ids":[12,10751,14,35],"id":826510,"original_language":"en","original_title":"Harold and the Purple Crayon","overview":"Inside of his book, adventurous Harold can make anything come to life simply by drawing it. After he grows up and draws himself off the book's pages and into the physical world, Harold finds he has a lot to learn about real life.","popularity":487.115,"poster_path":"/dEsuQOZwdaFAVL26RjgjwGl9j7m.jpg","release_date":"2024-07-31","title":"Harold and the Purple Crayon","video":false,"vote_average":7.009,"vote_count":108},{"adult":false,"backdrop_path":"/h9YlRHAZWOWtGonllmj6JJg1FrE.jpg","genre_ids":[28,12,16,10751,14],"id":588648,"original_language":"zh","original_title":"Dragonkeeper","overview":"Set in Han Imperial China, the plot follows the adventures of enslaved girl Ping with ancient dragon Long Danzi. Dragons had been banished from the kingdom. Ping, an orphan, finds one of the last remaining dragon eggs. Palace guards force Ping to run away in order to return the dragon egg to the ocean and save all dragons from extinction. Ping discovers that she is a true Dragonkeeper.","popularity":481.386,"poster_path":"/ggZGnJLzO3BTu7ysuuIzou3Oex5.jpg","release_date":"2024-04-11","title":"Dragonkeeper","video":false,"vote_average":7.253,"vote_count":89},{"adult":false,"backdrop_path":"/en3GU5uGkKaYmSyetHV4csHHiH3.jpg","genre_ids":[10752,28,18],"id":929590,"original_language":"en","original_title":"Civil War","overview":"In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.","popularity":350.113,"poster_path":"/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg","release_date":"2024-04-10","title":"Civil War","video":false,"vote_average":6.947,"vote_count":2363},{"adult":false,"backdrop_path":"/xJHokMbljvjADYdit5fK5VQsXEG.jpg","genre_ids":[12,18,878],"id":157336,"original_language":"en","original_title":"Interstellar","overview":"The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.","popularity":245.073,"poster_path":"/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg","release_date":"2014-11-05","title":"Interstellar","video":false,"vote_average":8.44,"vote_count":35166},{"adult":false,"backdrop_path":"/2XCmJWRZIQtHzikNsW29l9oy5Fb.jpg","genre_ids":[53,27],"id":804616,"original_language":"en","original_title":"Something in the Water","overview":"After lesbian couple Meg and Kayla split following a traumatic homophobic incident, their three friends are intent on mending the rift during the wedding of Lizzie at a paradise resort. But a pre-wedding boat excursion turns to disaster and the wedding breakfast is likely to be the five girls!","popularity":277.085,"poster_path":"/1iWGGxHEwswZGvPSoMZlLFf0PNq.jpg","release_date":"2024-03-22","title":"Something in the Water","video":false,"vote_average":6.075,"vote_count":146},{"adult":false,"backdrop_path":"/61yrVrkOH75fUtExDZ4Hi0KqOmc.jpg","genre_ids":[27,53,35],"id":1225377,"original_language":"en","original_title":"The Mouse Trap","overview":"It's Alex's 21st Birthday, but she's stuck at the amusement arcade on a late shift so her friends decide to surprise her, but a masked killer dressed as Mickey Mouse decides to play a game of his own with them which she must survive.","popularity":289.348,"poster_path":"/3ovFaFeojLFIl5ClqhtgYMDS8sE.jpg","release_date":"2024-08-23","title":"The Mouse Trap","video":false,"vote_average":5.2,"vote_count":26},{"adult":false,"backdrop_path":"/6GhU4BJnqLSaAuz0yQBq3RfdzsF.jpg","genre_ids":[27,9648],"id":1216191,"original_language":"en","original_title":"Oddity","overview":"After the brutal murder of her twin sister, Darcy goes after those responsible by using haunted items as her tools for revenge.","popularity":261.618,"poster_path":"/uln9Efc2vzDOl0Fue2BPs8l1WO7.jpg","release_date":"2024-07-19","title":"Oddity","video":false,"vote_average":6.891,"vote_count":147},{"adult":false,"backdrop_path":"/wkPPRIducGfsbaUPsWfw0MCQdX7.jpg","genre_ids":[28,35,12],"id":1051891,"original_language":"en","original_title":"Thelma","overview":"When 93-year-old Thelma Post gets duped by a phone scammer pretending to be her grandson, she sets out on a treacherous quest across the city to reclaim what was taken from her.","popularity":183.227,"poster_path":"/rUcuageYgv9SsJoWuc0seRWG6JC.jpg","release_date":"2024-06-21","title":"Thelma","video":false,"vote_average":7.1,"vote_count":100},{"adult":false,"backdrop_path":"/jtSCugyOC4gtKqVXK3WaaxRNzqZ.jpg","genre_ids":[18],"id":1103621,"original_language":"th","original_title":"หลานม่า","overview":"A man quits work to care for dying grandmother, motivated by her fortune. He schemes to win her favor before she passes.","popularity":180.265,"poster_path":"/9Xa0Grd2jq2lM2gqcoTB4F9TjMd.jpg","release_date":"2024-04-04","title":"How to Make Millions Before Grandma Dies","video":false,"vote_average":8.2,"vote_count":31},{"adult":false,"backdrop_path":"/62zw627mH74rng9zc4tFfaR54KW.jpg","genre_ids":[16,878,10751],"id":1184918,"original_language":"en","original_title":"The Wild Robot","overview":"After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the island's animals and cares for an orphaned baby goose.","popularity":195.022,"poster_path":"/vcZfDONCxoOU7mosZEnkhYujBEG.jpg","release_date":"2024-09-12","title":"The Wild Robot","video":false,"vote_average":9.1,"vote_count":8},{"adult":false,"backdrop_path":"/2u7zbn8EudG6kLlBzUYqP8RyFU4.jpg","genre_ids":[12,14,28],"id":122,"original_language":"en","original_title":"The Lord of the Rings: The Return of the King","overview":"As armies mass for a final battle that will decide the fate of the world--and powerful, ancient forces of Light and Dark compete to determine the outcome--one member of the Fellowship of the Ring is revealed as the noble heir to the throne of the Kings of Men. Yet, the sole hope for triumph over evil lies with a brave hobbit, Frodo, who, accompanied by his loyal friend Sam and the hideous, wretched Gollum, ventures deep into the very dark heart of Mordor on his seemingly impossible quest to destroy the Ring of Power.​","popularity":187.206,"poster_path":"/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg","release_date":"2003-12-17","title":"The Lord of the Rings: The Return of the King","video":false,"vote_average":8.48,"vote_count":23907},{"adult":false,"backdrop_path":"/x2RS3uTcsJJ9IfjNPcgDmukoEcQ.jpg","genre_ids":[12,14,28],"id":120,"original_language":"en","original_title":"The Lord of the Rings: The Fellowship of the Ring","overview":"Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.","popularity":156.111,"poster_path":"/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg","release_date":"2001-12-18","title":"The Lord of the Rings: The Fellowship of the Ring","video":false,"vote_average":8.4,"vote_count":24836}]
/// total_pages : 64
/// total_results : 1273

Upcoming upcomingFromJson(String str) => Upcoming.fromJson(json.decode(str));
String upcomingToJson(Upcoming data) => json.encode(data.toJson());
class Upcoming {
  Upcoming({
      Dates? dates, 
      num? page, 
      List<UpcomingResults>? results,
      num? totalPages, 
      num? totalResults,}){
    _dates = dates;
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  Upcoming.fromJson(dynamic json) {
    _dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(UpcomingResults.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  Dates? _dates;
  num? _page;
  List<UpcomingResults>? _results;
  num? _totalPages;
  num? _totalResults;
Upcoming copyWith({  Dates? dates,
  num? page,
  List<UpcomingResults>? results,
  num? totalPages,
  num? totalResults,
}) => Upcoming(  dates: dates ?? _dates,
  page: page ?? _page,
  results: results ?? _results,
  totalPages: totalPages ?? _totalPages,
  totalResults: totalResults ?? _totalResults,
);
  Dates? get dates => _dates;
  num? get page => _page;
  List<UpcomingResults>? get results => _results;
  num? get totalPages => _totalPages;
  num? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dates != null) {
      map['dates'] = _dates?.toJson();
    }
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}