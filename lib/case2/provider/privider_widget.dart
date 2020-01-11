import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:provider/provider.dart';
import 'package:redux_scopedmodel_bloc/case2/provider/page_model.dart';
import 'package:redux_scopedmodel_bloc/case2/provider/provider_model.dart';

class ProviderWidget extends StatefulWidget {
  final int index;
  ProviderWidget(this.index);
  @override
  _StatsWidgetState createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<ProviderWidget> {
  @override
  void initState() {
    super.initState();
  }

  /// bloc 必须使用stf, 否则无法dispose释放资源：
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('----------------------> provider item rebuild');
    StatsProvider _statsProvider =
        Provider.of<Case2PageModel>(context).widgets[widget.index];
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
          child: ChangeNotifierProvider.value(
            value: _statsProvider,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: _SparkLine()),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0), child: _Btn()),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 拆分粒度更细的组件，让更新的组件粒度最小化：
class _Btn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('----------------------> provider btn rebuild');

    return RaisedButton(
      child: Text(
          Provider.of<StatsProvider>(context).isTimerOn ? 'Stop' : 'Start'),
      onPressed: () => Provider.of<StatsProvider>(context).isTimerOn
          ? Provider.of<StatsProvider>(context).stop()
          : Provider.of<StatsProvider>(context).start(),
    );
  }
}

/// 拆分粒度更细的组件，让更新的组件粒度最小化：
class _SparkLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('----------------------> provider stas rebuild');
    return Sparkline(
      data: Provider.of<StatsProvider>(context).stats,
      pointsMode: PointsMode.all,
      pointColor: Colors.red,
    );
  }
}
