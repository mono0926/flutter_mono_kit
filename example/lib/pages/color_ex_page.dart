import 'package:example/router.dart';
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
        brightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pascalCaseFromRouteName(routeName)),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: List.generate(
            2,
            (_) => const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
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
