import 'package:flutter/material.dart';

class AutomaticKeepAliveClient extends StatefulWidget {
  const AutomaticKeepAliveClient({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AutomaticKeepAliveClient> createState() =>
      _AutomaticKeepAliveClientState();
}

class _AutomaticKeepAliveClientState extends State<AutomaticKeepAliveClient>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
