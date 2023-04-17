import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/apiusecases.dart';

import '../../filmstyle/liststyle3.dart';
import 'Listgenersfilms_viewmodel.dart';

class bloclist extends StatefulWidget {
  num id;
  bloclist({required this.id});

  @override
  State<bloclist> createState() => _bloclistState();
}

class _bloclistState extends State<bloclist> {
  Listgenersfilms_viewmodel viewmodel =
      Listgenersfilms_viewmodel(ingectApicase());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getlist(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Listgenersfilms_viewmodel, genersfilmsWidgetState>(
      bloc: viewmodel,
      builder: (context, state) {
        if (state is genersfilmsResponce) {
          return  liststyle3(list:state.list,);
        } else if (state is genersfilmsEroorState) {
          return Text(
            state.error,
            style: TextStyle(color: Colors.white, fontSize: 50),
          );
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
