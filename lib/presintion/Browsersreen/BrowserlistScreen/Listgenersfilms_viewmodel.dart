
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/model/whatchback.dart';

import '../../../domain/Excetpion/ServarError.dart';
import '../../../domain/Excetpion/connectionerro.dart';
import '../../../domain/usecases/apiusecases.dart';

class Listgenersfilms_viewmodel extends Cubit<genersfilmsWidgetState>{
  ApiCases apiCases;
  Listgenersfilms_viewmodel(this.apiCases):super(genersfilmsLoadingstate());

  getlist(num id)async{
    try {
      var res = await apiCases.getgenerfilmss(id);
      print(res!.length);
      emit(genersfilmsResponce(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(genersfilmsEroorState(e.error));
      if(e is ServarError)
        emit(genersfilmsEroorState(e.message));

    }

  }

}

abstract class genersfilmsWidgetState{
}
class genersfilmsLoadingstate extends genersfilmsWidgetState{}
class genersfilmsResponce extends genersfilmsWidgetState{
  List<watchback> list;
  genersfilmsResponce(this.list);
}
class genersfilmsEroorState extends genersfilmsWidgetState{
  String error;
  genersfilmsEroorState(this.error);

}