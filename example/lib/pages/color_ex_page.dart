import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

final _swatch = const Color(0xFFF44336).materialColor;

class ColorExRoute extends GoRouteData {
  const ColorExRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ColorExPage();
}

class ColorExPage extends StatelessWidget {
  const ColorExPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        // primarySwatch: _swatch,
        brightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pascalCaseFromRouteName(
              GoRouterState.of(context).uri.toString().toString())),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: List.generate(
            2,
            (_) => const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
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
