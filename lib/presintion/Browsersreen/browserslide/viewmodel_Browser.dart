
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/Excetpion/ServarError.dart';
import 'package:movies/domain/model/Genrs.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../../domain/Excetpion/connectionerro.dart';
import '../../../domain/model/reocommeded.dart';


class Browser_viewmodel extends Cubit<BrowserWidgetState>{
  ApiCases apiCases;
  Browser_viewmodel(this.apiCases):super(BrowserLoadingstate());

  getlist()async{
    try {
      var res = await apiCases.getGenres();
      print(res![0].name);
      emit(BrowserResponce(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(BrowserEroorState(e.error));
      if(e is ServarError)
        emit(BrowserEroorState(e.message));

    }

  }

}

abstract class BrowserWidgetState{
}
class BrowserLoadingstate extends BrowserWidgetState{}
class BrowserResponce extends BrowserWidgetState{
  List<Genres> list;
  BrowserResponce(this.list);
}
class BrowserEroorState extends BrowserWidgetState{
  String error;
  BrowserEroorState(this.error);

}
