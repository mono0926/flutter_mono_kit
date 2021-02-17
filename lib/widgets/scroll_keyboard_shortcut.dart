import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

class ScrollKeyboardShortcut extends StatefulWidget {
  const ScrollKeyboardShortcut({
    Key? key,
    required this.scrollController,
    required this.child,
    this.stepOffset = kPagingScrollOffset,
  }) : super(key: key);

  final Widget child;
  final PagingScrollController scrollController;
  final double stepOffset;

  @override
  _ScrollKeyboardShortcutState createState() => _ScrollKeyboardShortcutState();
}

class _ScrollKeyboardShortcutState extends State<ScrollKeyboardShortcut> {
  final _focusNode = FocusNode();
  final _onKeySubject = PublishSubject<RawKeyEvent>();
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
    _focusNode.dispose();
    _onKeySubject.close();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (ModalRoute.of(context)!.isCurrent) {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: _disabledNavigationKeys,
      child: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: _onKeySubject.add,
        child: widget.child,
      ),
    );
  }

  void _onKey(RawKeyEvent event) {
    if (event is! RawKeyDownEvent) {
      return;
    }
    final logicalKey = event.logicalKey;
    logger.fine('keyId: $logicalKey');
    if (logicalKey == LogicalKeyboardKey.arrowUp) {
      _scrollController.scrollUp(offset: _stepOffset);
    } else if (logicalKey == LogicalKeyboardKey.arrowDown) {
      _scrollController.scrollDown(offset: _stepOffset);
    } else if (logicalKey == LogicalKeyboardKey.pageUp) {
      _scrollController.scrollToPreviousPage();
    } else if (logicalKey == LogicalKeyboardKey.pageDown) {
      _scrollController.scrollToNextPage();
    } else if (logicalKey == LogicalKeyboardKey.home) {
      _scrollController.scrollToTop();
    } else if (logicalKey == LogicalKeyboardKey.end) {
      _scrollController.scrollToBottom();
    } else if (logicalKey == LogicalKeyboardKey.space) {
      event.isShiftPressed
          ? _scrollController.scrollToPreviousPage()
          : _scrollController.scrollToNextPage();
    }
  }

  final Map<LogicalKeySet, Intent> _disabledNavigationKeys =
      <LogicalKeySet, Intent>{
    LogicalKeySet(LogicalKeyboardKey.arrowUp): Intent.doNothing,
    LogicalKeySet(LogicalKeyboardKey.arrowDown): Intent.doNothing,
    LogicalKeySet(LogicalKeyboardKey.arrowLeft): Intent.doNothing,
    LogicalKeySet(LogicalKeyboardKey.arrowRight): Intent.doNothing,
  };
}
