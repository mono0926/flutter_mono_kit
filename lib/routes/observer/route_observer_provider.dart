import 'package:flutter/widgets.dart';

class RouteObserverProvider extends InheritedWidget {
  const RouteObserverProvider({
    Key key,
    @required this.observer,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final RouteObserver<ModalRoute> observer;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static RouteObserver<ModalRoute> of(BuildContext context) => (context
          .ancestorInheritedElementForWidgetOfExactType(RouteObserverProvider)
          ?.widget as RouteObserverProvider)
      ?.observer;
}
