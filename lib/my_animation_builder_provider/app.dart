import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/my_animation_builder_provider/model.dart';
import 'package:redux_scopedmodel_bloc/my_animation_builder_provider/my_provider_page.dart';

class MyAnimationProviderChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cartModel = CartModel();
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('animationBuilder version chart'),
        ),
        body: Container(
            child: AnimatedBuilder(
          animation: _cartModel,
          builder: (BuildContext context, Widget child) {
            return InheritedProvider<CartModel>(
              data: _cartModel,
              child: MyProviderRoute(),
            );
          },
        )),
      ),
    );
  }
}
