import 'package:flutter/material.dart';

Future<T> showConfirmSheet<T>({
  @required BuildContext context,
  @required String title,
  String message,
  @required List<SheetAction<T>> actions,
}) {
  return showModalBottomSheet(
    context: context,
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
