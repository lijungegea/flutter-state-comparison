import 'package:fish_redux/fish_redux.dart';
import 'package:redux_scopedmodel_bloc/case2/fish_redux_adapter/case2_page/item_component/component.dart';
import 'package:redux_scopedmodel_bloc/case2/fish_redux_adapter/case2_page/state.dart';

import 'reducer.dart';

class Case2ListAdapter extends SourceFlowAdapter<Case2State> {
  Case2ListAdapter()
      : super(
          pool: <String, Component<Object>>{'item': ItemComponent()},
          reducer: buildReducer(),
        );
}
