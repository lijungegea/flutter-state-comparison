import 'package:flutter/material.dart';

// Type _typeOf<T>() => T;

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    BlocProvider<T> provider = context.dependOnInheritedWidgetOfExactType();
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

// class BlocProvider<T extends BlocBase> extends StatefulWidget {
//   BlocProvider({
//     Key key,
//     @required this.child,
//     @required this.bloc,
//   }) : super(key: key);

//   final Widget child;
//   final T bloc;

//   @override
//   _BlocProviderState<T> createState() => _BlocProviderState<T>();

//   static T of<T extends BlocBase>(BuildContext context) {
//     // final type = _typeOf<_BlocProviderInherited<T>>();
//     _BlocProviderInherited<T> provider = context.findAncestorStateOfType();
//     return provider?.bloc;
//   }
// }

// class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
//   @override
//   void dispose() {
//     widget.bloc?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new _BlocProviderInherited<T>(
//       bloc: widget.bloc,
//       child: widget.child,
//     );
//   }
// }

// class _BlocProviderInherited<T> extends InheritedWidget {
//   _BlocProviderInherited({
//     Key key,
//     @required Widget child,
//     @required this.bloc,
//   }) : super(key: key, child: child);

//   /// 暴露bloc给依赖的子类
//   final T bloc;

//   @override
//   bool updateShouldNotify(_BlocProviderInherited oldWidget) => true;
// }
