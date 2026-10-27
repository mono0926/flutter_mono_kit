import 'package:material_ui/material_ui.dart';

class const AutomaticKeepAliveClient({
  super.key,
  required final Widget child,
}) extends StatefulWidget {
  @override
  State<AutomaticKeepAliveClient> createState() =>
      _AutomaticKeepAliveClientState();
}

class _AutomaticKeepAliveClientState()
    extends State<AutomaticKeepAliveClient>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
