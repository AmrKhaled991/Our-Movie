import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../data/modelotp/FilmResponce.dart';
import 'filmdetiles_viewmodel.dart';

class desfilm extends StatefulWidget {
  @override
  num id;
  desfilm(this.id);
  State<desfilm> createState() => _desfilmState();
}

class _desfilmState extends State<desfilm> {
  filmdetiles_viewmodel viewmodel = filmdetiles_viewmodel(ingectApicase());
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getfilmdetils(widget.id);

  }
  Widget build(BuildContext context) {
    var mediaqurey = MediaQuery.of(context).size;
    return Container(
      width: mediaqurey.width * .57,
      height: 60,
      child: BlocBuilder<filmdetiles_viewmodel, FilmWidgetState>(
        bloc: viewmodel,
        builder: (context, state) {
          if (state is FilmSource) {
            print('];]]];]];];');
            return GridView.builder(itemCount: state.film.genres!.length,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
                   mainAxisExtent: 30,crossAxisSpacing: 2
                 ,
             ),
                itemBuilder: (context, index) => Card(
                    color: Colors.black,
                    child: Center(
                      child: Text(state.film.genres![index].name!,style: TextStyle(color: Colors.white,fontSize:
                      7),),
                    )),);
          } else if (state is FilmEroorState) {
            return Text(
              state.error,
              style: TextStyle(color: Colors.white, fontSize: 50),
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
