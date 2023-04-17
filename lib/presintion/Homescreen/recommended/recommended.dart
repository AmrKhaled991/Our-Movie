import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presintion/Homescreen/recommended/recommended_viewmodel.dart';
import 'package:movies/presintion/filmstyle/liststyle.dart';

import '../../../domain/usecases/apiusecases.dart';
import '../../theming/appthem.dart';

class Recommended0 extends StatefulWidget {

  @override
  State<Recommended0> createState() => _Recommended0State();
}

class _Recommended0State extends State<Recommended0> {
  recommended_viewmodel viewmodel=recommended_viewmodel(ingectApicase());
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getlistrecommneded();
  }
  Widget build(BuildContext context) {
    var mediaqurey=MediaQuery.of(context).size;
    return
      Container(
        height: mediaqurey.height*.3,
        color: Appthem.listcolor,
        child: BlocBuilder<recommended_viewmodel,WidgetState>(
          bloc: viewmodel,
          builder:(context, state) {
            if(state is RecommendResponce){
              return liststyle(state.list);
            }else if(state is EroorState){
              return Text(state.error,style: TextStyle(color: Colors.white,fontSize:50 ),);
            }else
              return Center(child: CircularProgressIndicator());

          },
        ),
      );
  }
}
