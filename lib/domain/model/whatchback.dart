import 'package:movies/data/firebase/firebasemodel/whatchback.dart';

class watchback {
  String? title;
  String? releaseDate;
  String? overview;
  num? id;
  String? posterPath;
  String? backdropPath;
  num? voteAverage;
  String? idfire;

  watchback(
      {this.idfire,required this.title,
        required this.voteAverage,
        required this.overview,
        required this.id,
        required this.posterPath,
        required this.releaseDate,
        required this.backdropPath});

  whatchbackotp getotp() {
    return whatchbackotp(
      backdropPath: backdropPath,
      title: title,
      release_data: releaseDate,
      des: overview,
      id: id,
      poster_path: posterPath,
      vote_average: voteAverage,
      idfire: idfire
    );
  }

}
