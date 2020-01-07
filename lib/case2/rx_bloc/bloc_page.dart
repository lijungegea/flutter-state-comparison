import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/rx_bloc/bloc_widget.dart';

class BlocPage extends StatefulWidget {
  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  /// NOTE: 此处Widget自己管理了列表状态，更好的做法是利用BLocProvider 把BLoC模型抽离出来
  List<BlocWidget> _widgets = <BlocWidget>[];

  @override
  void initState() {
    super.initState();
    _widgets = <BlocWidget>[BlocWidget()];
  }

  @override
  void dispose() {
    _widgets.clear();
    _widgets = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC version'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Add...'),
            onPressed: () {
              _widgets.add(BlocWidget());
              setState(() {});
            },
          ),
        ],
      ),
      body: Container(
        child: GridView.builder(
          itemCount: _widgets.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return _widgets[index];
          },
        ),
      ),
    );
  }
}
