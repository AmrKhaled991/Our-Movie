
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/Excetpion/ServarError.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../../domain/Excetpion/connectionerro.dart';
import '../../../domain/model/reocommeded.dart';


class recommended_viewmodel extends Cubit<WidgetState>{
  ApiCases apiCases;
  recommended_viewmodel(this.apiCases):super(Loadingstate());

  getlistrecommneded()async{
    try {
      var res = await apiCases.getrecommended();
      print(res[0].title);
      emit(RecommendResponce(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(EroorState(e.error));
      if(e is ServarError)
        emit(EroorState(e.message));

    }

  }

}

abstract class WidgetState{
}
class Loadingstate extends WidgetState{}
class RecommendResponce extends WidgetState{
  List<Recommended> list;
  RecommendResponce(this.list);
}
class EroorState extends WidgetState{
  String error;
  EroorState(this.error);

}
