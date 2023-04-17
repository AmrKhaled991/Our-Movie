
import 'package:movies/domain/model/Genrs.dart';
import 'package:movies/domain/model/NewRelase.dart';
import 'package:movies/domain/model/Popular.dart';
import 'package:movies/domain/model/Similar.dart';

import '../model/Film.dart';
import '../model/reocommeded.dart';
import '../model/whatchback.dart';

abstract class Myreposatry{
  Future<List<Recommended>>getrecommend();
  Future<List<NewRelase>?> getreNews();
  Future<List<popular>> getpopuler();
  Future<List<Genres>?> getGenres();
  Future<Film> getfildetils(num id);
  Future<List<Similar>> getSimlarfilm(num id);
  Future<List<watchback>>getgenersfilm(num id);
  Future<List<watchback>>getsearchfilm(String search);
  Future<List<watchback>>watchbak();
  Future<void> add(watchback watch);
  Future<void> delet(watchback watch);
}

abstract class NetworkData implements Myreposatry{
  Future<List<Recommended>> getrecommend() ;
  Future<List<NewRelase>?> getreNews();
  Future<List<Genres>?> getGenres();
  Future<List<popular>> getpopuler();
  Future<Film> getfildetils(num id);
  Future<List<Similar>> getSimlarfilm(num id);
  Future<List<watchback>>getgenersfilm(num id);
  Future<List<watchback>>getsearchfilm(String search);
  Future<List<watchback>>watchbak();
  Future<void> add(watchback watch);
  Future<void> delet(watchback watch);
}

