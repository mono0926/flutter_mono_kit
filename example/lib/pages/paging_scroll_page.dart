import 'dart:math';

import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

Color _generateColor() => Color(Random().nextInt(0xFFFFFF) | 0xFF888888);

class PagingScrollRoute extends GoRouteData {
  const PagingScrollRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PagingScrollPage();
}

class PagingScrollPage extends StatelessWidget {
  const PagingScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(
            GoRouterState.of(context).uri.toString().toString())),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _scrollController = PagingScrollController();
  @override
  Widget build(BuildContext context) {
    return ScrollKeyboardShortcut(
      scrollController: _scrollController,
      child: Column(
        children: [
          _buildControlPanel(),
          _buildScrollView(),
        ],
      ),
    );
  }

  Widget _buildScrollView() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
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
              ElevatedButton(
                onPressed: _scrollController.scrollToTop,
                child: const Text('TOP'),
              ),
              ElevatedButton(
                onPressed: _scrollController.scrollToPreviousPage,
                child: const Text('UP️'),
              ),
              ElevatedButton(
                onPressed: _scrollController.scrollUp,
                child: const Text('↑'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _scrollController.scrollToBottom,
                child: const Text('BOTTOM️'),
              ),
              ElevatedButton(
                onPressed: _scrollController.scrollToNextPage,
                child: const Text('DOWN'),
              ),
              ElevatedButton(
                onPressed: _scrollController.scrollDown,
                child: const Text('↓'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
