import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class PagingScrollPage extends StatefulWidget {
  const PagingScrollPage({Key key}) : super(key: key);

  static const routeName = '/paging_scroll';

  @override
  _PagingScrollPageState createState() => _PagingScrollPageState();
}

class _PagingScrollPageState extends State<PagingScrollPage> {
  Color _generateColor() => Color(Random().nextInt(0xFFFFFFFF));

  final _pagingScrollController = PagingScrollController(
    scrollController: ScrollController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(PagingScrollPage.routeName)),
      body: Column(
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: const Text('⏫️'),
                onPressed: _pagingScrollController.scrollToTop,
              ),
              RaisedButton(
                child: const Text('⬆️'),
                onPressed: _pagingScrollController.scrollUp,
              ),
              RaisedButton(
                child: const Text('⬇️'),
                onPressed: _pagingScrollController.scrollDown,
              ),
              RaisedButton(
                child: const Text('⏬️'),
                onPressed: _pagingScrollController.scrollToBottom,
              ),
            ],
          ),
          Expanded(
            child: PagingScroll(
              controller: _pagingScrollController,
              scrollView: ListView.builder(
                controller: _pagingScrollController.scrollController,
                itemBuilder: (context, index) {
                  return Container(
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
          ),
        ],
      ),
    );
  }
}
