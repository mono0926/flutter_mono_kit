import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mono_kit/utils/logger.dart';

const kPagingScrollDuration = Duration(milliseconds: 200);
const _curve = Curves.easeInOut;
const kPagingScrollOffset = 44.0;

class PagingScrollController extends ScrollController
    with PagingScrollControllerMixin {}

mixin PagingScrollControllerMixin on ScrollController {
  BuildContext get _context => position.context.notificationContext!;
  RenderBox? get _renderBox {
    final box = _context.findRenderObject()! as RenderBox;
    return box is RenderBox ? box : null;
  }

  double get _height => _renderBox?.size.height ?? 0;
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
      duration: kPagingScrollDuration,
      curve: _curve,
    );
  }

  void scrollToPreviousPage() {
    scrollUp(offset: _height);
  }

  void scrollUp({double offset = kPagingScrollOffset}) {
    if (_reachedToTop) {
      logger.fine('Reached to top');
      return;
    }
    animateTo(
      max(_minScrollExtent, this.offset - offset),
      duration: kPagingScrollDuration,
      curve: _curve,
    );
  }

  void scrollToNextPage() {
    scrollDown(offset: _height);
  }

  void scrollDown({double offset = kPagingScrollOffset}) {
    if (_reachedToBottom) {
      logger.fine('Reached to bottom');
      return;
    }
    animateTo(
      min(_maxScrollExtent, this.offset + offset),
      duration: kPagingScrollDuration,
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
      duration: kPagingScrollDuration,
      curve: _curve,
    );
  }
}
