import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/model/Popular.dart';

import '../../../domain/Excetpion/ServarError.dart';
import '../../../domain/Excetpion/connectionerro.dart';
import '../../../domain/usecases/apiusecases.dart';

class  popular_viewmodel extends Cubit<PopularWidgetState> {
  ApiCases apiCases;
  popular_viewmodel(this.apiCases):super(Loadingstate());

  getpopularfilms()async{
    print('heloooooo');
    try {
      var res = await apiCases.getpopular();
      emit(PopularResponce(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(PopularEroorState(e.error));
      if(e is ServarError)
        emit(PopularEroorState(e.message));

    }

  }

}

abstract class PopularWidgetState{
}
class Loadingstate extends PopularWidgetState{}
class PopularResponce extends PopularWidgetState{
  List<popular> list;
  PopularResponce(this.list);
}
class PopularEroorState extends PopularWidgetState{
  String error;
  PopularEroorState(this.error);

}