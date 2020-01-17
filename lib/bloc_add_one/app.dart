import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/bloc_add_one/bloc_Add_one_page.dart';
import 'package:redux_scopedmodel_bloc/bloc_add_one/increment_bloc.dart';
import 'package:redux_scopedmodel_bloc/common/bloc_provider.dart';

class BlocAddOneApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Streams Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: CounterPage(),
      ),
    );
  }
}
