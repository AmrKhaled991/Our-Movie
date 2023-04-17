
import 'package:movies/data/NetworkDataimpl/NetworkDataimpl.dart';
import 'package:movies/domain/model/Film.dart';
import 'package:movies/domain/model/Genrs.dart';
import 'package:movies/domain/model/NewRelase.dart';
import 'package:movies/domain/model/Popular.dart';
import 'package:movies/domain/model/Similar.dart';
import 'package:movies/domain/model/reocommeded.dart';
import 'package:movies/domain/model/whatchback.dart';
import 'package:movies/domain/reopsatry/MyRoposarty.dart';

class reposatryimpl extends Myreposatry {
  NetworkData data;

  reposatryimpl(this.data);

  Future<List<Recommended>> getrecommend() async {
    var list = await data.getrecommend();
    return list;
  }

  @override
  Future<List<NewRelase>?> getreNews() async {
    var res = await data.getreNews();
    return res;
  }

  @override
  Future<List<popular>> getpopuler() async {
    var list = await data.getpopuler();
    return list;
  }

  @override
  Future<Film> getfildetils(num id)async {
    var film=await data.getfildetils(id);
   return film;
  }

  @override
  Future<List<Similar>> getSimlarfilm(num id)async {
    var similar=await data.getSimlarfilm(id);
    return similar;
  }
  @override
  Future<List<Genres>?> getGenres() async{
    var list = await data.getGenres();
    return list;
  }
  @override
  Future<List<watchback>> getgenersfilm(num id) async{
    var list = await data.getgenersfilm(id);
    return list;
  }

  @override
  Future<List<watchback>> getsearchfilm(String search)async {
    var list = await data.getsearchfilm(search);
    return list;
  }

  @override
  Future<List<watchback>> watchbak()async {
    var list = await data.watchbak();
    return list;
  }

  @override
  Future<void> add(watchback watch)async {
    // TODO: implement add
    return await data.add(watch);
  }

  @override
  Future<void> delet(watchback watch)async {
    // TODO: implement add
    return await data.delet(watch);
  }
}
Myreposatry ingectrepo(){
  return reposatryimpl(injNetworkData());
}