import 'package:flutter/widgets.dart';

extension NavigatorStateEx on NavigatorState {
  void popToRouteName(String name) {
    popUntil(ModalRoute.withName(name));
  }

  void popToRoot() {
    popUntil((r) => r.isFirst);
  }

  void popToFirstFullscreenDialog() {
    popUntil((r) => (r is PageRoute) && r.fullscreenDialog);
  }
}
