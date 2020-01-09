import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/my_stateful_provider/model.dart';

class MyProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<MyProviderRoute> {
  @override
  Widget build(BuildContext context) {
    var cart = ChangeNotifierProvider.of<CartModel>(context);
    return Center(
      child: Builder(builder: (context) {
        return Column(
          children: <Widget>[
            Builder(builder: (context) {
              return Text("总价: ${cart.totalPrice}");
            }),
            Builder(builder: (context) {
              print("RaisedButton build"); //在后面优化部分会用到
              return RaisedButton(
                child: Text("添加商品"),
                onPressed: () {
                  //给购物车中添加商品，添加后总价会更新
                  ChangeNotifierProvider.of<CartModel>(context)
                      .add(Item(20.0, 2));
                },
              );
            }),
          ],
        );
      }),
    );
  }
}
