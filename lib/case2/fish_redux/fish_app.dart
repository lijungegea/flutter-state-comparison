import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;

import 'global_store/state.dart';
import 'global_store/store.dart';
import './case2_page/page.dart';

/// 创建应用的根 Widget
/// 1. 创建一个简单的路由，并注册页面
/// 2. 对所需的页面进行和 AppStore 的连接
/// 3. 对所需的页面进行 AOP 的增强
Widget case2FishRuduxApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      /// 注册Todo编辑页面
      'case2_page': Case2Page(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if (page.isTypeof<GlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(GlobalStore.store,
            (Object pagestate, GlobalState appState) {
          final GlobalBaseState p = pagestate;
          if (p.themeColor != appState.themeColor) {
            if (pagestate is Cloneable) {
              final Object copy = pagestate.clone();
              final GlobalBaseState newState = copy;
              newState.themeColor = appState.themeColor;
              return newState;
            }
          }
          return pagestate;
        });
      }

      /// AOP
      /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
      /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: <EffectMiddleware<dynamic>>[
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );

  return MaterialApp(
    title: 'Fluro',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('case2_page', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}

class PersistAcion {
  const PersistAcion(this.type, {this.payload});
  final Object type;
  final dynamic payload;
}

// class Persistor<T>{

// }

// final persistor = Persistor<T>(
//   storage: FlutterStorage(),
//   serializer: JsonSerializer<T>(T.fromJson),
// );

//     Middleware<T> persistMiddleware = (
//         {Dispatch dispatch, Get<T> getState}) {
//       return (Dispatch next) {
//         return (Action action) {
//           next(action);
//           if (action is PersistAction) {
//             print('PersistState: ${action.type} ${action.payload}');
//             persistor.save(getState());
//           }
//         };
//       };
//     };

// var initialState;
// try {
//   initialState = await persistor.load();
// } on SerializationException {
//   // 第一次加载程序时，还没有任何数据，加载数据会失败
//   // 此时使用初始化数据
//   initialState = PageState();
// }
