import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/rx_bloc/stats_bloc.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class BlocWidget extends StatefulWidget {
  @override
  _StatsWidgetState createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<BlocWidget> {
  StatsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = StatsBloc();
  }

  /// bloc 必须使用stf, 否则无法dispose释放资源：
  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('-------------------------------> bloc item build');
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
            color: Colors.black,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                child: StreamBuilder<List<double>>(
                    stream: _bloc.statsOut,
                    initialData: [],
                    builder: (BuildContext context,
                        AsyncSnapshot<List<double>> snapshot) {
                      print('----------------------->bloc stas stream build');

                      List<double> data =
                          (snapshot.data == null || snapshot.data.length == 0)
                              ? [1.0]
                              : snapshot.data;

                      return Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: Sparkline(
                          pointsMode: PointsMode.all,
                          pointColor: Colors.red,
                          data: data,
                        ),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<bool>(
                      stream: _bloc.timerActivityOut,
                      initialData: false,
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        bool isActive = snapshot.data;
                        print('----------------------->bloc btn stream build');

                        return RaisedButton(
                          child: Text(isActive ? 'Stop' : 'Start'),
                          onPressed: () =>
                              isActive ? _bloc.stop() : _bloc.start(),
                        );
                      }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
