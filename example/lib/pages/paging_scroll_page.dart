import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

Color _generateColor() => Color(Random().nextInt(0xFFFFFF) | 0xFF888888);
const _offset = 44.0;

class PagingScrollPage extends StatelessWidget {
  const PagingScrollPage({Key key}) : super(key: key);

  static const routeName = '/paging_scroll';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text(PagingScrollPage.routeName)),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key key}) : super(key: key);
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _pagingScrollController = PagingScrollController(
    scrollController: ScrollController(),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildControlPanel(),
        _buildScrollView(),
      ],
    );
  }

  Widget _buildScrollView() {
    return Expanded(
      child: PagingScroll(
        controller: _pagingScrollController,
        scrollView: ListView.builder(
          controller: _pagingScrollController.scrollController,
          itemBuilder: (context, index) {
            return Container(
              key: ValueKey(index),
              height: 88,
              color: _generateColor(),
              child: Center(
                child: Text(
                  index.toString(),
                ),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }

  Widget _buildControlPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: const Text('TOP'),
                onPressed: _pagingScrollController.scrollToTop,
              ),
              RaisedButton(
                child: const Text('UP️'),
                onPressed: _pagingScrollController.scrollUp,
              ),
              RaisedButton(
                child: const Text('↑'),
                onPressed: () =>
                    _pagingScrollController.scrollUpOffset(_offset),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: const Text('BOTTOM️'),
                onPressed: _pagingScrollController.scrollToBottom,
              ),
              RaisedButton(
                child: const Text('DOWN'),
                onPressed: _pagingScrollController.scrollDown,
              ),
              RaisedButton(
                child: const Text('↓'),
                onPressed: () =>
                    _pagingScrollController.scrollDownOffset(_offset),
              ),
            ],
          ),
        ],
      ),
    );
  }
}