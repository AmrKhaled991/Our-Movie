class NewRelase{num? id;
String? overview;
num? popularity;
String? posterPath;
String? title;
num? voteAverage;
String? releaseDate;
String? backdropPath;
NewRelase(
    {this.posterPath,
      this.id,
      this.title,
      this.voteAverage,
      this.backdropPath,
      this.releaseDate,
      this.overview,
      this.popularity});
}