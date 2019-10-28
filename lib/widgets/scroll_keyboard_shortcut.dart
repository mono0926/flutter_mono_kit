import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/utils/logger.dart';

class ScrollKeyboardShortcut extends StatefulWidget {
  const ScrollKeyboardShortcut({
    Key key,
    @required this.scrollController,
    @required this.child,
    this.stepOffset = 44,
  }) : super(key: key);

  final Widget child;
  final PagingScrollController scrollController;
  final double stepOffset;

  @override
  _ScrollKeyboardShortcutState createState() => _ScrollKeyboardShortcutState();
}

class _ScrollKeyboardShortcutState extends State<ScrollKeyboardShortcut> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: _disabledNavigationKeys,
      child: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (event) {
          if (event.runtimeType == RawKeyDownEvent) {
            final logicalKey = event.logicalKey;
            logger.fine('keyId: $logicalKey');
            if (logicalKey == LogicalKeyboardKey.arrowUp) {
              widget.scrollController.scrollUp(offset: widget.stepOffset);
            } else if (logicalKey == LogicalKeyboardKey.arrowDown) {
              widget.scrollController.scrollDown(offset: widget.stepOffset);
            } else if (logicalKey == LogicalKeyboardKey.pageUp) {
              widget.scrollController.scrollToPreviousPage();
            } else if (logicalKey == LogicalKeyboardKey.pageDown) {
              widget.scrollController.scrollToNextPage();
            } else if (logicalKey == LogicalKeyboardKey.home) {
              widget.scrollController.scrollToTop();
            } else if (logicalKey == LogicalKeyboardKey.end) {
              widget.scrollController.scrollToBottom();
            } else if (logicalKey == LogicalKeyboardKey.space) {
              event.isShiftPressed
                  ? widget.scrollController.scrollToPreviousPage()
                  : widget.scrollController.scrollToNextPage();
            }
          }
        },
        child: widget.child,
      ),
    );
  }
}

final Map<LogicalKeySet, Intent> _disabledNavigationKeys =
    <LogicalKeySet, Intent>{
  LogicalKeySet(LogicalKeyboardKey.arrowUp): Intent.doNothing,
  LogicalKeySet(LogicalKeyboardKey.arrowDown): Intent.doNothing,
  LogicalKeySet(LogicalKeyboardKey.arrowLeft): Intent.doNothing,
  LogicalKeySet(LogicalKeyboardKey.arrowRight): Intent.doNothing,
};
