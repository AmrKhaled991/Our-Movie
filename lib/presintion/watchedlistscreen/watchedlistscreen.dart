import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/apiusecases.dart';
import 'package:movies/presintion/filmstyle/liststyle3.dart';
import 'package:movies/presintion/watchedlistscreen/watch_viewmodel.dart';

  class Watchedlistscreen extends StatefulWidget{

    static String RoutName='watchedlistscreen';

    @override
    State<Watchedlistscreen> createState() => _WatchedlistscreenState();
  }

  class _WatchedlistscreenState extends State<Watchedlistscreen> {
    whatch_viewmodel viewmodel=whatch_viewmodel(ingectApicase());
    void initState() {
      // TODO: implement initState
      super.initState();
      viewmodel.watchbacklist();
    }
    Widget build(BuildContext context) {
      var mediaqurey=MediaQuery.of(context).size;
      return
        Container(

          child: BlocBuilder<whatch_viewmodel,whatchWidgetState>(
            bloc: viewmodel,
            builder:(context, state) {
              if(state is whatchSource){
                return liststyle3(list: state.film,function: setstat);

              }else if(state is whatchEroorState){
                return Text(state.error,style: TextStyle(color: Colors.white,fontSize:50 ),);
              }else
                return Center(child: CircularProgressIndicator());
            },
          ),
        );
    }
    var amr=1;
    void setstat(){
      print('pgfdspfg');
      setState(() {
        amr++;
      });
    }
  }
