
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/Excetpion/ServarError.dart';
import 'package:movies/domain/model/NewRelase.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../../domain/Excetpion/connectionerro.dart';


class newrelase_viewmodel extends Cubit<NewWidgetState>{
  ApiCases apiCases;
  newrelase_viewmodel(this.apiCases):super(Loadingstate());

  getlistNews()async{
  try {
  var res = await apiCases.getnewrelase();
      emit(NewSource(res!));
    }  catch (e) {
      if(e is Conectionerror)
        emit(NewEroorState(e.error));
      if(e is ServarError)
        emit(NewEroorState(e.message));

    }

  }

}

abstract class NewWidgetState{
}
class Loadingstate extends NewWidgetState{}
class NewSource extends NewWidgetState{
  List<NewRelase> list;
  NewSource(this.list);
}
class NewEroorState extends NewWidgetState{
  String error;
  NewEroorState(this.error);

}
