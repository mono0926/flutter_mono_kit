import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

final _swatch = const Color(0xFFF44336).materialColor;

class ColorExPage extends StatelessWidget {
  const ColorExPage({Key key}) : super(key: key);

  static const routeName = '/color_ex';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: _swatch,
      ),
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: List.generate(
            2,
            (_) => BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: const Text(''),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(44),
          child: Column(
            children: [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]
                .map(
                  (k) => Expanded(
                    child: Container(
                      color: _swatch[k],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
