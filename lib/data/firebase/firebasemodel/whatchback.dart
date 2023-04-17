import '../../../domain/model/whatchback.dart';


class whatchbackotp {
  String? title;
  String? release_data;
  String? des;
  num? id;
  String? poster_path;
  num? vote_average;
  String? backdropPath;
  String? idfire;

  whatchbackotp(
      {this.idfire,
        required this.title,
        required this.release_data,
        required this.des,
        required this.id,
        required this.poster_path,
        required this.vote_average,
        required this.backdropPath});

  whatchbackotp.fromjeson(dynamic json)
      : this(
    title: json['title'],
    release_data: json['release_data'],
    des: json['des'],
    id: json['id'],
    idfire: json['idfire'],
    vote_average: json['vote_average'],
    poster_path: json['poster_path'],
    backdropPath: json['backdropPath'],

  );

  Map<String, Object?> firbse() {
    return {
      'title': title,
      'release_data': release_data,
      'des': des,
      'id': id,
      'poster_path': poster_path,
      'vote_average': vote_average,
      'idfire':idfire,
      'backdropPath':backdropPath
    };
  }

  watchback watchback1() {
    return watchback(
        title: title,
        voteAverage: vote_average,
        overview: des,
        id: id,
        posterPath: poster_path,
        releaseDate: release_data,
        backdropPath: backdropPath

    );
  }
}
