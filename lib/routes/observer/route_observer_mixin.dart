import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

mixin RouteObserverMixin<T extends StatefulWidget> on State<T>, RouteAware {
  RouteObserver<ModalRoute> _routeObserver;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_routeObserver != null) {
      // 何度もsubscribeしても多重購読にはならず問題ないもの、不要な処理なのでreturn
      return;
    }
    // dispose時にはcontextにアクセスできないのでこのタイミングで保持しておく
    _routeObserver = Provider.of(context, listen: false)
      ..subscribe(
        this,
        ModalRoute.of(context),
      );
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }
}
