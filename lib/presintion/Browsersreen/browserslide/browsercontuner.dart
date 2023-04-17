import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presintion/Browsersreen/browserslide/viewmodel_Browser.dart';
import 'package:movies/presintion/Homescreen/recommended/recommended_viewmodel.dart';
import 'package:movies/presintion/filmstyle/liststyle.dart';

import '../../../domain/usecases/apiusecases.dart';
import '../../theming/appthem.dart';
import '../BrowserlistScreen/Listgenersfilms.dart';

class Browserslide extends StatefulWidget {

  @override
  State<Browserslide> createState() => _BrowserslideState();
}

class _BrowserslideState extends State<Browserslide> {
  Browser_viewmodel viewmodel=Browser_viewmodel(ingectApicase());
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getlist();
  }
  Widget build(BuildContext context) {
    var mediaqurey=MediaQuery.of(context).size;
    return
      Container(
        padding: EdgeInsets.all(5),
        child: BlocBuilder<Browser_viewmodel,BrowserWidgetState>(
          bloc: viewmodel,
          builder:(context, state) {
            if(state is BrowserResponce){
              return GridView.builder(itemCount: state.list.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Listgenersfilms.RoutName,arguments:{
                      'name':state.list[index].name!,'id':state.list[index].id
                    });
                  },
                    child: Container(
                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'),fit:BoxFit.cover)),
                    child: Center(child: Text(state.list[index].name!,style: Theme.of(context).primaryTextTheme.titleMedium,)),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,mainAxisSpacing: 20,
                    crossAxisSpacing: 15,childAspectRatio: 1.5
                ),
              );
            }else if(state is BrowserEroorState){
              return Text(state.error,style: TextStyle(color: Colors.white,fontSize:50 ),);
            }else
              return Center(child: CircularProgressIndicator());
          },
        ),
      );
  }
}
