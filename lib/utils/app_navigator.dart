import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigator {
  AppNavigator({
    this.l10n = const AppNavigatorL10n(),
  });

  final AppNavigatorL10n l10n;
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  NavigatorState get navigator => key.currentState;
  BuildContext get descendantContext => navigator.overlay.context;

  void popToRouteName(String name) {
    navigator.popUntil(ModalRoute.withName(name));
  }

  void popToRoot() {
    navigator.popUntil((r) => r.isFirst);
  }

  void popToFirstFullscreenDialog() {
    navigator.popUntil((r) => (r is PageRoute) && r.fullscreenDialog);
  }

  void showErrorDialog(dynamic error) {
    showDialog<dynamic>(
      context: descendantContext,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.errorTitle,
          style: TextStyle(
            color: Theme.of(context).errorColor,
          ),
        ),
        content: Text(
          l10n.localizeError(error),
        ),
        actions: [
          FlatButton(
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> showOkDialog({
    @required String title,
    @required String message,
    String okLabel,
  }) {
    return showConfirmDialog<void>(
      title: title,
      message: message,
      actions: [
        DialogAction<dynamic>(
          label: okLabel ??
              MaterialLocalizations.of(descendantContext).okButtonLabel,
        )
      ],
    );
  }

  Future<T> showConfirmDialog<T>({
    @required String title,
    @required String message,
    @required List<DialogAction<T>> actions,
  }) {
    return showDialog<T>(
      context: descendantContext,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: actions
            .map(
              (a) => FlatButton(
                child: Text(a.label),
                onPressed: () {
                  Navigator.of(context).pop<T>(a.key);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Future<T> showConfirmSheet<T>({
    @required String title,
    String message,
    @required List<SheetAction<T>> actions,
  }) {
    return showModalBottomSheet(
      context: descendantContext,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message == null)
                ListTile(
                  title: Text(title),
                  dense: true,
                ),
              if (message != null) ...[
                ListTile(
                  title: Text(title),
                  subtitle: Text(message),
                ),
                const Divider()
              ],
              ...actions.map(
                (a) {
                  return ListTile(
                    leading: Icon(a.icon),
                    title: Text(a.label),
                    onTap: () => Navigator.of(context).pop(a.key),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

@immutable
class AppNavigatorL10n {
  const AppNavigatorL10n();
  String get errorTitle => 'エラーが発生しました';
  String localizeError(dynamic error) => '$error';
}

@immutable
class DialogAction<T> {
  const DialogAction({
    @required this.label,
    this.key,
  });

  final T key;
  final String label;
}

@immutable
class SheetAction<T> {
  const SheetAction({
    @required this.label,
    @required this.icon,
    this.key,
  });

  final String label;
  final IconData icon;
  final T key;
}
