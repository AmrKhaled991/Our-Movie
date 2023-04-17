import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/apiusecases.dart';
import 'package:movies/presintion/FilmdetilesScreen/SimilarList/similarlist_viewmodel.dart';

import '../../../domain/model/Similar.dart';
import '../../Homescreen/recommended/recommended_viewmodel.dart';
import '../../filmstyle/liststyle.dart';
import '../../theming/appthem.dart';

class Similarlist extends StatefulWidget {
  num id;
  Similarlist(this.id);
  @override
  State<Similarlist> createState() => _SimilarlistState();
}

class _SimilarlistState extends State<Similarlist> {
  similar_viewmodel viewmodel=similar_viewmodel(ingectApicase());
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getlistNews(widget.id!);
  }
  Widget build(BuildContext context) {
    var mediaqurey=MediaQuery.of(context).size;
    return
      Container(
        height: mediaqurey.height*.3,
        color: Appthem.listcolor,
        child: BlocBuilder<similar_viewmodel,SimilarWidgetState>(
          bloc: viewmodel,
          builder:(context, state) {
            if(state is similarSource){
              return liststyle(state.similar);
            }else if(state is SimilarEroorState){
              return Text(state.error,style: TextStyle(color: Colors.white,fontSize:50 ),);
            }else
              return Center(child: CircularProgressIndicator());
          },
        ),
      );
  }

}
