import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/my_stateful_provider/model.dart';
import 'package:redux_scopedmodel_bloc/my_stateful_provider/my_provider_page.dart';

class MyProviderChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('stateFul version chart'),
        ),
        body: Container(
            child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: MyProviderRoute(),
        )),
      ),
    );
  }
}
