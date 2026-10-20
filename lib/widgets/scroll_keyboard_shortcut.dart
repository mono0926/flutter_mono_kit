import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

class ScrollKeyboardShortcut extends StatefulWidget {
  const ScrollKeyboardShortcut({
    super.key,
    required this.scrollController,
    required this.child,
    this.stepOffset = kPagingScrollOffset,
  });

  final Widget child;
  final PagingScrollController scrollController;
  final double stepOffset;

  @override
  State<ScrollKeyboardShortcut> createState() => _ScrollKeyboardShortcutState();
}

class _ScrollKeyboardShortcutState extends State<ScrollKeyboardShortcut> {
  final _focusNode = FocusNode();
  final _onKeySubject = PublishSubject<KeyEvent>();
  final _subscriptionHolder = SubscriptionHolder();
  PagingScrollController get _scrollController => widget.scrollController;
  double get _stepOffset => widget.stepOffset;

  @override
  void initState() {
    super.initState();

    _subscriptionHolder.add(
      _onKeySubject.throttleTime(kPagingScrollDuration).listen(_onKey),
    );
  }

  @override
  void dispose() {
    _subscriptionHolder.dispose();
    _focusNode.dispose();
    _onKeySubject.close();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (ModalRoute.of(context)?.isCurrent ?? false) {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: _disabledNavigationKeys,
      child: KeyboardListener(
        focusNode: _focusNode,
        onKeyEvent: _onKeySubject.add,
        child: widget.child,
      ),
    );
  }

  void _onKey(KeyEvent event) {
    if (event is! KeyDownEvent) {
      return;
    }
    final logicalKey = event.logicalKey;
    logger.fine('keyId: $logicalKey');
    switch (logicalKey) {
      case LogicalKeyboardKey.arrowUp:
        _scrollController.scrollUp(offset: _stepOffset);
      case LogicalKeyboardKey.arrowDown:
        _scrollController.scrollDown(offset: _stepOffset);
      case LogicalKeyboardKey.pageUp:
        _scrollController.scrollToPreviousPage();
      case LogicalKeyboardKey.pageDown:
        _scrollController.scrollToNextPage();
      case LogicalKeyboardKey.home:
        _scrollController.scrollToTop();
      case LogicalKeyboardKey.end:
        _scrollController.scrollToBottom();
      case LogicalKeyboardKey.space:
        HardwareKeyboard.instance.isShiftPressed
            ? _scrollController.scrollToPreviousPage()
            : _scrollController.scrollToNextPage();
    }
  }

  static const _disabledNavigationKeys = <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowUp): Intent.doNothing,
    SingleActivator(LogicalKeyboardKey.arrowDown): Intent.doNothing,
    SingleActivator(LogicalKeyboardKey.arrowLeft): Intent.doNothing,
    SingleActivator(LogicalKeyboardKey.arrowRight): Intent.doNothing,
  };
}
