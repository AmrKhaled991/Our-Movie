


import 'package:flutter/cupertino.dart';
import 'package:movies/data/Apimanger/Apimanger.dart';
import 'package:movies/data/reposatryimpl/reposatryimpl.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../domain/model/whatchback.dart';

class AppProvider extends ChangeNotifier{
 late List<watchback> list;

  ApiCases firebaseCase=ApiCases(ingectrepo());
  getlist()async{
    var listshowlater=await firebaseCase.getwatchback();
    list=listshowlater;
    notifyListeners();
  }
  void addfilm(watchback we)async{
    if(list.any((element) => element.id==we.id)==true){
      firebaseCase.delet(we);
      print('مدخلش');
      notifyListeners();
    }if(
        list.any((element) => element.id==we.id)==false){
      firebaseCase.add(we);
      print('دخل');
      notifyListeners();
    return;
    }
    notifyListeners();
  }
  bool check(watchback we){
    if(list.any((element) => element.title==we.title)==true){
      return true;
    }
    return false;
  }

}