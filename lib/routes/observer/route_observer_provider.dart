import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RouteObserverProvider extends Provider<RouteObserver<ModalRoute>> {
  RouteObserverProvider({
    Key key,
    @required Widget child,
  }) : super.value(
          value: RouteObserver<ModalRoute>(),
          key: key,
          child: child,
          updateShouldNotify: (_, __) => false,
        );

  static RouteObserver<ModalRoute> of(BuildContext context) =>
      Provider.of<RouteObserver<ModalRoute>>(
        context,
        listen: false,
      );
}
