
import 'dart:io';

import 'package:movies/data/Apimanger/Apimanger.dart';
import 'package:movies/data/firebase/firebasemodel/whatchback.dart';
import 'package:movies/domain/Excetpion/ServarError.dart';
import 'package:movies/domain/model/Film.dart';
import 'package:movies/domain/model/Genrs.dart';
import 'package:movies/domain/model/NewRelase.dart';
import 'package:movies/domain/model/Popular.dart';
import 'package:movies/domain/model/Similar.dart';
import 'package:movies/domain/model/reocommeded.dart';
import 'package:movies/domain/reopsatry/MyRoposarty.dart';

import '../../domain/Excetpion/connectionerro.dart';
import '../../domain/model/whatchback.dart';
import '../firebase/firebaseauth.dart';

class NetworkDataimpl extends NetworkData{
   Apimanger apimanger;
   FirebaseUtils firebaseUtils;
   NetworkDataimpl(this.apimanger,this.firebaseUtils);
  Future<List<Recommended>> getrecommend() async{
      try {
        var res=await apimanger.getrecommendedfilms();
        if(res.status_message!=null){
          throw ServarError(res.status_message!);
        }

      var recommend= res.results!.map((recommend) => recommend.getrecommend()).toList();
         return recommend;
      } on HttpException catch (e) {
        throw Conectionerror('internet error');
      }on IOException catch (e) {
        throw Conectionerror('internet error');
      }
  }
  Future<List<popular>> getpopuler() async{
    try {
        var res=await apimanger.getrepopularfilms();
        if(res.status_message!=null){
          throw ServarError(res.status_message!);
        }
        var populer= res.results!.map((recommend) => recommend.getpopuler()).toList();

         return populer;
      } on HttpException catch (e) {
        throw Conectionerror('internet error');
      }on IOException catch (e) {
        throw Conectionerror('internet error');
      }
  }

  @override
  Future<List<NewRelase>?> getreNews()async {
    try {

      var res=await apimanger.getreNewfilms();
      if(res.status_message!=null){
        throw ServarError(res.status_message!);
      }
        List<NewRelase>?news=[];
     news.add(res.getnewrelase());
      return news;
    } on HttpException catch (e) {
      throw Conectionerror('internet error');
    }on IOException catch (e) {
      throw Conectionerror('internet error');
    }
  }
  @override
  Future<Film> getfildetils(num id)async {
    try {
      var res=await apimanger.getfilm(id);
      if(res.status_message!=null){
        throw ServarError(res.status_message!);
      }

      var film= res.getfilm();
      return film;
    } on HttpException catch (e) {
      throw Conectionerror('internet error');
    }on IOException catch (e) {
      throw Conectionerror('internet error');
    }
  }

  @override
  Future<List<Similar>> getSimlarfilm(num id)async {
    try {
      var res=await apimanger.getsimilarfilm(id);
      if(res.status_message!=null){
        throw ServarError(res.status_message!);
      }

      var film= res.results!.map((similar) => similar.getSimiler()).toList();
      return film;
    } on HttpException catch (e) {
      throw Conectionerror('internet error');
    }on IOException catch (e) {
      throw Conectionerror('internet error');
    }
  }

  @override
  Future<List<Genres>?> getGenres()async {
    try {
    var res=await apimanger.getGenrResponse();
    if(res.status_message!=null){
    throw ServarError(res.status_message!);
    }
    var populer= res.genres!.map((recommend) => recommend.getgeners()).toList();

    return populer;
    } on HttpException catch (e) {
    throw Conectionerror('internet error');
    }on IOException catch (e) {
    throw Conectionerror('internet error');
    }
  }

  @override
  Future<List<watchback>> getgenersfilm(num id)async {
     try {
       var res=await apimanger.getgenersfilm(id);
       if(res.status_message!=null){
         throw ServarError(res.status_message!);
       }
       var film= res.results!.map((similar) => similar.getwatchgeners()).toList();
       return film;
     } on HttpException catch (e) {
       throw Conectionerror('internet error');
     }on IOException catch (e) {
       throw Conectionerror('internet error');
     }
   }

  @override
  Future<List<watchback>> getsearchfilm(String search)async {
    try {
      var res=await apimanger.getsearch(search);
      if(res.status_message!=null){
        throw ServarError(res.status_message!);
      }
      var film= res.results!.map((similar) => similar.getfilms()).toList();
      return film;
    } on HttpException catch (e) {
      throw Conectionerror('internet error');
    }on IOException catch (e) {
      throw Conectionerror('internet error');
    }
  }

  @override
  Future<List<watchback>> watchbak()async {
    try {
      var list = await firebaseUtils.getfirbselist();
      return list;
    } on Exception catch (e) {
      throw ('error firebase');
    }
  }

  @override
  Future<void> add(watchback watch) {
    // TODO: implement add
    return firebaseUtils.addfilm(watch);
  }

  @override
  Future<void> delet(watchback watch) {
    // TODO: implement delet
    return firebaseUtils.delettask(watch);
  }

}


NetworkData injNetworkData(){
  return NetworkDataimpl(Apimanger(),FirebaseUtils());
}