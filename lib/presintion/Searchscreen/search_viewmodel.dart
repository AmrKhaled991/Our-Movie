import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/model/whatchback.dart';
import '../../../domain/Excetpion/ServarError.dart';
import '../../../domain/Excetpion/connectionerro.dart';
import '../../../domain/usecases/apiusecases.dart';

class  search_viewmodel extends Cubit<searchWidgetState> {
  ApiCases apiCases;
  search_viewmodel(this.apiCases):super(searchLoadingstate());

  getpopularfilms(String key)async{
    print('heloooooo');
    try {
      var res = await apiCases.getsearchfilmss(key);
      emit(searchResponce(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(searchEroorState(e.error));
      if(e is ServarError)
        emit(searchEroorState(e.message));

    }

  }

}

abstract class searchWidgetState{
}
class searchLoadingstate extends searchWidgetState{}
class searchResponce extends searchWidgetState{
  List<watchback> list;
  searchResponce(this.list);
}
class searchEroorState extends searchWidgetState{
  String error;
  searchEroorState(this.error);

}