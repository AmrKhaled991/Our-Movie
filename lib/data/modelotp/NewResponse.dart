import 'package:movies/domain/model/NewRelase.dart';

/// adult : false
/// backdrop_path : null
/// belongs_to_collection : null
/// budget : 0
/// genres : []
/// homepage : ""
/// id : 1106451
/// imdb_id : null
/// original_language : "en"
/// original_title : "Liberty Avenue"
/// overview : "A struggling heroin addict takes revenge on his dealer who stripped his last connection to a normal life - his dog."
/// popularity : 0.0
/// poster_path : null
/// production_companies : []
/// production_countries : []
/// release_date : ""
/// revenue : 0
/// runtime : 6
/// spoken_languages : []
/// status : "Released"
/// tagline : "A struggling heroin addict takes revenge on his dealer who stripped his last connection to a normal life - his dog."
/// title : "Liberty Avenue"
/// video : false
/// vote_average : 0.0
/// vote_count : 0

class NewResponse {
  bool? adult;
  dynamic backdropPath;
  dynamic belongsToCollection;
  num? budget;
  List<dynamic>? genres;
  String? homepage;
  num? id;
  dynamic imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  dynamic posterPath;
  List<dynamic>? productionCompanies;
  List<dynamic>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<dynamic>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
  String? status_message;
  NewResponse({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  NewResponse.fromJson(dynamic json) {
    status_message = json['status_message'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];

    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
  NewRelase getnewrelase(){
    return NewRelase(posterPath:posterPath ,id: id,popularity: popularity,overview: overview,title:title ,voteAverage: voteAverage,backdropPath:backdropPath ,releaseDate: releaseDate);
  }
}