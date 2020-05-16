// import 'dart:async';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// typedef _VoidCallback = void Function();

// const String PERSIST_REDUCER = '_persist';
// const String PERSIST_ACTION = '_persist';
// const String SAVE_ACTION = '_save';
// const String PERSISTED_ACTION = '_persisted';
// const String SAVED_ACTION = '_saved';
// const String PREFIX = 'perist:';

// class PersistorBase{
//   void fromJson(Map<String, dynamic> json){}
//   Map<String, dynamic> toJson(){
//     return <String, dynamic>{};
//   }

//   /// 解析JSON MAP中的对象和数组
//   dynamic fromMapItem<T extends PersistorBase>(dynamic obj, Function creator) {
//     print('fromMapItem');
//     final bool isArray = obj is List;
//     return isArray ? obj.map((dynamic item) {
//       if(item == null) return null;
//       PersistorBase data = creator();
//       try {
//         data.fromJson(item);
//       } catch (e) {
//         return null;
//       }
//       return data;
//     }).where((item)=> item != null).toList() : ((){
//       if(obj == null) return null;
//       PersistorBase item = creator();
//       try {
//         item.fromJson(obj);
//       } catch (e) {
//         return null;
//       }
//       return item;
//     })();
//   }

//   /// 对象和数组构建为JSON MAP
//   dynamic toMapItem<T extends PersistorBase>(dynamic data) {
//     if(data == null) return null;
//     return data is List ? data.map((dynamic item)=> (item as T).toJson()).toList() : (data as T).toJson();
//   }
// }

// class Persistor extends PersistorBase {

//   Persistor();

//   int version = -1;
//   bool persist = false;
//   DateTime updateAt = DateTime.now();

//   @override
//   void fromJson(Map<String,dynamic> json) {
//     version = json['version'];
//     persist = json['persist'];
//     updateAt = DateTime.fromMillisecondsSinceEpoch(json['updateAt']);
//   }

//   @override
//   Map<String,dynamic> toJson() => <String,dynamic>{
//     'version': version,
//     'persist' :persist,
//     'updateAt': updateAt.millisecondsSinceEpoch,
//   };
// }

// class ReduxPersistor {
//   ReduxPersistor({ this.store, this.heartBeat }){
//     storeSubCallback = (){
//       startPersist();
//     };
//     store.subscribe(startPersist);
//     store.rootReducer.reducers[PERSIST_REDUCER] = PersistReducer(persist: this, store: store);
//     store.rootState[PERSIST_REDUCER] = StoreOfState<Persistor>(state: Persistor(), updateAt: DateTime.now());
//   }
//   Store store;
//   Timer timer;
//   // 心跳时长 默认1500毫秒
//   int heartBeat = 1500;

//   _VoidCallback storeSubCallback;

//   void startPersist() {
//       // 如果还有处于激活中的定时器，则直接取消掉，进入下一个心跳
//       if(timer != null && timer.isActive) timer.cancel();
//       timer = Timer(Duration(milliseconds: heartBeat), ()=> save());
//   }

//   Future<dynamic> persist() async {
//     final  Map<String, StoreOfState> state = store.getState();
//     await Future.wait<dynamic>(state.entries.map((item) async {
//       final String persistJSON = await getJSON(item.key);
//       Map<String, dynamic>  persistItem = persistJSON != null ? JsonDecoder().convert(persistJSON) : null;
//       if(persistItem != null) {
//        StoreOfState storeOfState = store.rootState[item.key];
//        StateTmpl stateTmpl = (storeOfState.getState() as StateTmpl);
//        try{
//           stateTmpl.fromJson(persistItem);
//        } catch(e) {

//        }
//        storeOfState.setState(stateTmpl);
//       }
//       return await Future<dynamic>.delayed(Duration(milliseconds: 1));
//     }));
//     store.dispatch(Action(PERSISTED_ACTION, <String,dynamic>{}));
//   }

//   Future<dynamic> save() async {
//     Map<String, StoreOfState> state = store.getState();
//     await Future.wait<dynamic>(state.entries.map((item) async {
//       try {
//         final String persistJSON = JsonEncoder().convert(item.value.clone().getState());
//         return await saveJSON(item.key, persistJSON);
//       } catch (e) {
//         print(e);
//       }
//     }));
//     store.dispatch(Action(SAVED_ACTION, <String,dynamic>{}));
//   }

//   Future<dynamic> saveJSON(String key, String persistJSON) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return await sharedPreferences.setString(PREFIX+key, persistJSON);
//   }

//   Future<String> getJSON(String key) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String persistJSON = sharedPreferences.getString(PREFIX+key);
//     return persistJSON;
//   }
// }

// class PersistReducer extends Reducer<Persistor> {

//   PersistReducer({ this.persist, Store store }): super(store: store);

//   ReduxPersistor persist;
//   /// 禁用通知页面
//   @override
//   bool canUpdate(StoreOfState<Persistor> lState, StoreOfState<Persistor> nState) => false;

//   @override
//   Future<StoreOfState<Persistor>> runReducer(StoreOfState<Persistor> state, Action action) async {
//     final Persistor lState = state.getState();
//     switch (action.type) {
//       case PERSIST_ACTION:
//         await persist.persist();
//         break;
//       case SAVE_ACTION:
//         await persist.save();
//         break;
//       case PERSISTED_ACTION:
//         lState.version += 1;
//         lState.persist = true;
//         state.setState(lState);
//         break;
//       case SAVED_ACTION:
//         lState.updateAt = DateTime.now();
//         state.setState(lState);
//         break;
//       default: break;
//     }
//     return state;
//   }
// }
