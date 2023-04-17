import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/model/Similar.dart';

import '../../../domain/Excetpion/ServarError.dart';
import '../../../domain/Excetpion/connectionerro.dart';
import '../../../domain/usecases/apiusecases.dart';

class similar_viewmodel extends Cubit<SimilarWidgetState>{
  ApiCases apiCases;
  similar_viewmodel(this.apiCases):super(SimilarLoadingstate());

  getlistNews(num id)async{
    try {
      var res = await apiCases.getSimilar(id);
      emit(similarSource(res));
    }  catch (e) {
      if(e is Conectionerror)
        emit(SimilarEroorState(e.error));
      if(e is ServarError)
        emit(SimilarEroorState(e.message));

    }

  }

}

abstract class SimilarWidgetState{
}
class SimilarLoadingstate extends SimilarWidgetState{}
class similarSource extends SimilarWidgetState{
  List<Similar> similar=[];
  similarSource(this.similar);
}
class SimilarEroorState extends SimilarWidgetState{
  String error;
  SimilarEroorState(this.error);

}
