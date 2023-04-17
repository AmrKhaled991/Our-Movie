
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/Excetpion/ServarError.dart';
import 'package:movies/domain/model/NewRelase.dart';
import 'package:movies/domain/model/whatchback.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../../domain/Excetpion/connectionerro.dart';
import '../../domain/model/Film.dart';


class whatch_viewmodel extends Cubit<whatchWidgetState>{
  ApiCases firebaseCase;
  whatch_viewmodel(this.firebaseCase):super(Loadingstate());

  watchbacklist()async{
    try {
      var res = await firebaseCase.getwatchback();
      emit(whatchSource(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(whatchEroorState(e.error));
      if(e is ServarError)
        emit(whatchEroorState(e.message));

    }

  }

}

abstract class whatchWidgetState{
}
class Loadingstate extends whatchWidgetState{}
class whatchSource extends whatchWidgetState{
  List<watchback> film;
  whatchSource(this.film);
}
class whatchEroorState extends whatchWidgetState{
  String error;
  whatchEroorState(this.error);

}
