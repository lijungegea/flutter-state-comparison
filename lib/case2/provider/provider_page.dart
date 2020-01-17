import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redux_scopedmodel_bloc/case2/provider/page_model.dart';
import 'package:redux_scopedmodel_bloc/case2/provider/privider_widget.dart';

class Case2ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _case2PageModel = Provider.of<Case2PageModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider version'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Add...'),
            onPressed: () {
              _case2PageModel.addWidget();
            },
          ),
        ],
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: ProviderWidget(0),
            ),
            new SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _case2PageModel.widgets
                    .sublist(1)
                    .map((f) => ProviderWidget(index + 1))
                    .toList()[index];
              }, childCount: _case2PageModel.widgets.length - 1),
            )
          ],
        ),
      ),
    );
  }
}
