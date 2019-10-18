import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mono_kit/utils/logger.dart';

class PagingScroll extends StatelessWidget {
  const PagingScroll({
    Key key,
    this.scrollView,
    this.controller,
  }) : super(key: key);

  final ScrollView scrollView;
  final PagingScrollController controller;

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return scrollView;
  }
}

class PagingScrollController {
  PagingScrollController({
    @required this.scrollController,
  });

  final ScrollController scrollController;
  BuildContext context;

  static const _duration = Duration(milliseconds: 200);
  static const _curve = Curves.easeInOut;

  RenderBox get _renderBox {
    final box = context?.findRenderObject() as RenderBox;
    return box is RenderBox ? box : null;
  }

  double get _height => _renderBox?.size?.height ?? 0;
  double get _minScrollExtent => scrollController.position.minScrollExtent;
  double get _maxScrollExtent => scrollController.position.maxScrollExtent;
  bool get _reachedToTop => scrollController.offset <= _minScrollExtent;
  bool get _reachedToBottom => scrollController.offset >= _maxScrollExtent;

  void scrollToTop() {
    if (_reachedToTop) {
      logger.fine('Reached to top');
      return;
    }
    scrollController.animateTo(
      _minScrollExtent,
      duration: _duration,
      curve: _curve,
    );
  }

  void scrollUp() {
    scrollUpOffset(_height);
  }

  void scrollUpOffset(double offset) {
    if (_reachedToTop) {
      logger.fine('Reached to top');
      return;
    }
    scrollController.animateTo(
      max(_minScrollExtent, scrollController.offset - offset),
      duration: _duration,
      curve: _curve,
    );
  }

  void scrollDown() {
    scrollDownOffset(_height);
  }

  void scrollDownOffset(double offset) {
    if (_reachedToBottom) {
      logger.fine('Reached to bottom');
      return;
    }
    scrollController.animateTo(
      min(_maxScrollExtent, scrollController.offset + offset),
      duration: _duration,
      curve: _curve,
    );
  }

  void scrollToBottom() {
    if (_reachedToBottom) {
      logger.fine('Reached to bottom');
      return;
    }
    scrollController.animateTo(
      _maxScrollExtent,
      duration: _duration,
      curve: _curve,
    );
  }
}
