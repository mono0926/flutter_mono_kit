import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mono_kit/utils/logger.dart';

const _duration = Duration(milliseconds: 200);
const _curve = Curves.easeInOut;

// TODO(mono): Refactor by using extension
class PagingScrollController extends ScrollController {
  BuildContext get _context => position.context.notificationContext;
  RenderBox get _renderBox {
    final box = _context?.findRenderObject() as RenderBox;
    return box is RenderBox ? box : null;
  }

  double get _height => _renderBox?.size?.height ?? 0;
  double get _minScrollExtent => position.minScrollExtent;
  double get _maxScrollExtent => position.maxScrollExtent;
  bool get _reachedToTop => offset <= _minScrollExtent;
  bool get _reachedToBottom => offset >= _maxScrollExtent;

  void scrollToTop() {
    if (_reachedToTop) {
      logger.fine('Reached to top');
      return;
    }
    animateTo(
      _minScrollExtent,
      duration: _duration,
      curve: _curve,
    );
  }

  void scrollToPreviousPage() {
    scrollUp(offset: _height);
  }

  void scrollUp({double offset = 44}) {
    if (_reachedToTop) {
      logger.fine('Reached to top');
      return;
    }
    animateTo(
      max(_minScrollExtent, this.offset - offset),
      duration: _duration,
      curve: _curve,
    );
  }

  void scrollToNextPage() {
    scrollDown(offset: _height);
  }

  void scrollDown({double offset = 44}) {
    if (_reachedToBottom) {
      logger.fine('Reached to bottom');
      return;
    }
    animateTo(
      min(_maxScrollExtent, this.offset + offset),
      duration: _duration,
      curve: _curve,
    );
  }

  void scrollToBottom() {
    if (_reachedToBottom) {
      logger.fine('Reached to bottom');
      return;
    }
    animateTo(
      _maxScrollExtent,
      duration: _duration,
      curve: _curve,
    );
  }
}
