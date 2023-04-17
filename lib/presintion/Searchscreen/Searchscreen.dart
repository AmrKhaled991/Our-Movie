import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/apiusecases.dart';
import 'package:movies/presintion/Searchscreen/search_viewmodel.dart';
import 'package:movies/presintion/theming/appthem.dart';

import '../FilmdetilesScreen/FilmdetilesScreen.dart';
import '../filmstyle/filmstye2.dart';
import '../filmstyle/liststyle3.dart';

class Searchscreen extends StatefulWidget {
  @override
  static String RoutName = 'Searchscreen';

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController controller = TextEditingController();
   String? key;
  search_viewmodel viewmodel=search_viewmodel(ingectApicase());
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appthem.darkcolor,
        title: Container(
          height: 100,
          padding: EdgeInsets.all(25),
          child: TextField(
             onChanged: (value) {
               key=value;
               print(value);
               if(key!.isNotEmpty||key!=null){
                 viewmodel.getpopularfilms(key!);
               }
               setState(() {

               });
              },

            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.white,),
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.white),
              fillColor: Appthem.listcolor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body:key==null||key!.isEmpty?
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/vedio.png'),
                  Text(
                    'No Movies Found',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ):BlocBuilder<search_viewmodel, searchWidgetState>(
                  bloc: viewmodel,
                  builder: (context, state) {
              if (state is searchResponce) {
              return liststyle3(list:state.list);
              } else if (state is searchEroorState) {
              return Text(
              state.error,
              style: TextStyle(color: Colors.white, fontSize: 50),
              );
              } else
              return Center(child: CircularProgressIndicator());
              },
            )
    );
  }
}
