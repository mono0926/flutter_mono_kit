import 'package:flutter/widgets.dart';

extension NavigatorStateEx on NavigatorState {
  BuildContext get descendantContext => overlay.context;

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
