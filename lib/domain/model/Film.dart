import '../../data/modelotp/FilmResponce.dart';

/// adult : false
/// backdrop_path : "/vLNd80hOyMLpwbM41spelNtfyPY.jpg"
/// belongs_to_collection : null
/// budget : 0
/// genres : [{"id":18,"name":"Drama"},{"id":80,"name":"Crime"}]
/// homepage : ""
/// id : 1106451
/// imdb_id : null
/// original_language : "en"
/// original_title : "Liberty Avenue"
/// overview : "A struggling heroin addict takes revenge on his dealer who stripped away his last connection to a normal life - his dog."
/// popularity : 1.4
/// poster_path : "/lrt0pR9ekoKh0pDz1dExZ4kM25v.jpg"
/// production_companies : []
/// production_countries : []
/// release_date : ""
/// revenue : 0
/// runtime : 6
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Post Production"
/// tagline : ""
/// title : "Liberty Avenue"
/// video : false
/// vote_average : 0.0
/// vote_count : 0

class Film {
  Film({
    this.backdropPath,
    this.genres,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
  });

  String? backdropPath;
  List<Genres>? genres;
  num? id;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;


}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"



/// id : 18
/// name : "Drama"

