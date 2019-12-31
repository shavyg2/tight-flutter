library tight;

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef Widget ExposeHandler<T>(BuildContext context);

abstract class Tight<T>{
  void init();

  Widget expose(ExposeHandler<T> handler);

  Widget select<S>(ExposeHandler<T> handler,
      {@required S Function(BuildContext context) selector});

}

class TightController<T extends TightController<T>> extends ChangeNotifier implements Tight<T>{
  void init() {}

  Tight<T> get self{
    return this;
  }

  

  Widget expose(ExposeHandler<T> handler) {
    return ChangeNotifierProvider<T>.value(
      value: this,
      child: Consumer(
        builder: (BuildContext context, T value, Widget child) {
          return handler(context);
        },
        child: null,
      ),
    );
  }

  Widget select<S>(ExposeHandler<T> handler,
      {@required S Function(BuildContext context) selector}) {
    return ChangeNotifierProvider<T>.value(
      value: this,
      child: Selector<T, S>(
        selector: (BuildContext context, T state) {
          return selector(context);
        },
        builder: (BuildContext context, S state, Widget _) {
          return handler(context);
        },
        child: null,
      ),
    );
  }
}
