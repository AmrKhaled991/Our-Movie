
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presintion/Homescreen/recommended/recommended_viewmodel.dart';

import '../../../domain/usecases/apiusecases.dart';
import '../../filmstyle/liststyle.dart';
import '../../filmstyle/liststyle2.dart';
import '../../theming/appthem.dart';
import 'newrelase_viewmodel.dart';

class Newrelase extends StatefulWidget {

  @override
  State<Newrelase> createState() => _NewrelaseState();
}

class _NewrelaseState extends State<Newrelase> {
  newrelase_viewmodel viewmodel=newrelase_viewmodel(ingectApicase());
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getlistNews();
  }
  Widget build(BuildContext context) {
    var mediaqurey=MediaQuery.of(context).size;
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: mediaqurey.height*.2,
          color: Appthem.listcolor,
          child: BlocBuilder<newrelase_viewmodel,NewWidgetState>(
            bloc: viewmodel,
            builder:(context, state) {
              if(state is NewSource){
                return liststyle2(state.list);
              }else if(state is NewEroorState){
                return Text(state.error,style: TextStyle(color: Colors.white,fontSize:50 ),);
              }else
                return Center(child: CircularProgressIndicator());

            },
          ),
        ),
      );
  }
}
