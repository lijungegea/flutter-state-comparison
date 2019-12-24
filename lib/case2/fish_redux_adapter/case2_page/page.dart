import 'package:fish_redux/fish_redux.dart';
import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class Case2Page extends Page<Case2State, Map<String, dynamic>> {
  Case2Page()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<Case2State>(
            adapter: NoneConn<Case2State>() + Case2ListAdapter(),
          ),
          middleware: <Middleware<Case2State>>[],
        );
}
