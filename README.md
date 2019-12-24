# BLoC - ScopedModel - Redux - fishRedux - provider - Comparison

## 前言

目前 flutter 生态比较流行的数据流解决方案有：

-   `BLoC`： 流式响应式编程数据流
-   `ScopedModel`： 典型的基于`InheritedWidget`将 数据 **model** 扩展其子代
-   `Redux`：也就是 flutter-redux，经典的 redux 解决方案
-   `provider` 谷歌推荐的数据流方案
-   `fish-redux`：阿里咸鱼技术数据流框架

面对这么多的数据流解决方案，我们应该怎么用，什么时候该用，什么时候不该用，用哪一种……，每一种数据流本身都有其独特的设计思想，用法也比较抽象，网上对每种方案都是各执一词。不过没有数据的对比都是强词夺理瞎扯淡，这次我们首先对每种方案做一个基本的用法介绍(第一部分)，然后通过一个具体的 case(第二部分) ， 详细对比每种方案的优缺点，熟悉每种方案的基本用法。开始吧！

## 第一部分：它们都是些什么？

### Redux

Redux 是一个数据流管理框架，用与控制整个应用的数据流向与状态改变，其设计的主要原则有：

-   单一数据源，一个应用只存在一个用于储存数据的`store`，这点也是 redux 与其他方案的一个很大的区别；
-   state 的状态是只读的，改变 state 的唯一方式就是 `dispatch(action)`
-   `dispatch(action)` 首先会分配到**MiddleWare**里面，做一些其他操作，**MiddleWare**之后进入 `reducer` 进行改变`state`
-   整个改变 state 的过程都是纯函数，同一输入同一输出

> 下面简单介绍`redux`各个知识点，详细参见官方文档: [redux](https://www.redux.org.cn/)

#### action

`action`是一个描述如何改变 state 的载体，由标识符与具体数据组成，比如点击一个按钮，让一个初始值为 0 的状态改变为 1，那么对应的`action`应该是：

```dart
{
  type: ADD_TODO,
  payload: 1
}
```

#### reducer

`reducer` 接收旧的`state`和指定标识符的`action`为参数， 返回新的`state`;`(oldState, action) => newState`;这也是改变`state`唯一的方式；

> 这里需要注意引用指针问题，一般`state`为引用类型数据，改变某些属性值并不能生成新的`state`, 一般我们会对`state`进行克隆。

```dart
int counterReducer(int state, dynamic action) {
  if (action == ADD_TODO) {
    return state + 1;
  }

  return state;
}
```

至此，原汁原味的 redux 改变 `state` 的流程就走完了，用过成熟第三 redux 衍生库(fish-redux、redux-dva、redux-saga)的读者肯定会发现其中少了一个环节`effect`,
`effect`其实就是`redux`里面一个用于处理异步的中间件**MiddleWare**。下面我们仔细看看 reduex **MiddleWare**

#### MiddleWare

redux 中间件见解了 Koa 框架洋葱模型中间件，在`dispatch(action)`之后，调用 reducer 之前，依次遍历调用 MiddleWares 数组(`next(action)`)，中途可以执行任何异步操作(记录日志，API 请求等)，
最后再进入 reducer 改变状态；下面是中间件调用过程的雏形(js)：

```js
function applyMiddleware(store, middlewares) {
    middlewares = middlewares.slice();
    middlewares.reverse();

    let dispatch = store.dispatch;
    middlewares.forEach(middleware => (dispatch = middleware(store)(dispatch)));

    return Object.assign({}, store, { dispatch });
}
```

因为原生 redux 统一的中间件调用规则，那么任何 redux 中间件都将是一个接收 3 个参数的柯里化函数：依次是`store => next => action => {}`,
那么编写一个简单的处理异步的**MiddleWare**将非常简单：

```js
function createThunkMiddleware(extraArgument) {
    return ({ dispatch, getState }) => next => action => {
        if (typeof action === "function") {
            return action(dispatch, getState, extraArgument);
        }

        return next(action);
    };
}
```

这也是赫赫有名的`redux-thunk`的源码，十几行代码尽然有一万多 Star，惊呆了！然后我们再看`effect`就非常简单了：

#### effect

effect 是一堆异步操作的`Map`集合，也就是形成了`action.type`与异步操作的映射， 将`dispatch`过来的`action`通过 action 的标识符与固定的异步函数相关联：

`dispatch(action(type: 'A'))`------> `effectMiddleWare({A: (){ 执行异步函数……}})` -----> `reducer()` ------> `newState`


![redux 整体示意流程图如下：](https://www.didierboelens.com/images/models_redux_animation.gif)
