import 'package:movies/data/reposatryimpl/reposatryimpl.dart';
import 'package:movies/domain/model/Genrs.dart';
import 'package:movies/domain/model/NewRelase.dart';
import 'package:movies/domain/model/Similar.dart';
import 'package:movies/domain/reopsatry/MyRoposarty.dart';

import '../model/Film.dart';
import '../model/Popular.dart';
import '../model/reocommeded.dart';
import '../model/whatchback.dart';

class ApiCases{
  Myreposatry repo;
  ApiCases(this.repo);
  Future<List<Recommended>> getrecommended()async{
    var list=await repo.getrecommend();
    return list;
  }
  Future<List<NewRelase>?> getnewrelase()async{
    var list=await repo.getreNews();
    return list;
  }Future<List<Genres>?> getGenres()async{
    var list=await repo.getGenres();
    return list;
  }
  Future<List<popular>>getpopular()async{
    var list=await repo.getpopuler();
    return list;
  }Future<List<Similar>>getSimilar(num id)async{
    var list=await repo.getSimlarfilm(id);
    return list;
  }
  Future<Film> getfilmdetils(num id)async{
    var film= await repo.getfildetils(id);
    return film;
  }
  Future<List<watchback>> getgenerfilmss(num id)async{
    var film= repo.getgenersfilm(id);
    return film;} Future<List<watchback>> getsearchfilmss(String key)async{
    var film= repo.getsearchfilm(key);
    return film;}
  Future<List<watchback>> getwatchback() async {
    try {
      var list = await repo.watchbak();
      return list;
    } on Exception catch (e) {
      throw ('error firebase');
    }
  }

  Future<void> add(watchback watch) async {
    return repo.add(watch);
  }

  Future<void> delet(watchback watch) async {
    return repo.delet(watch);
  }
}
ApiCases ingectApicase(){
  return ApiCases(ingectrepo());
}