
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/Excetpion/ServarError.dart';
import 'package:movies/domain/model/NewRelase.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../../domain/Excetpion/connectionerro.dart';
import '../../domain/model/Film.dart';


class filmdetiles_viewmodel extends Cubit<FilmWidgetState>{
  ApiCases apiCases;
  filmdetiles_viewmodel(this.apiCases):super(Loadingstate());

  getfilmdetils(num id)async{
    try {
      var res = await apiCases.getfilmdetils(id);
      emit(FilmSource(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(FilmEroorState(e.error));
      if(e is ServarError)
        emit(FilmEroorState(e.message));

    }

  }

}

abstract class FilmWidgetState{
}
class Loadingstate extends FilmWidgetState{}
class FilmSource extends FilmWidgetState{
   Film film;
   FilmSource(this.film);
}
class FilmEroorState extends FilmWidgetState{
  String error;
  FilmEroorState(this.error);

}
