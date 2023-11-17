import 'package:example/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'cell.dart';
import 'data.dart';

class OverflowDetectableTextRoute extends GoRouteData {
  const OverflowDetectableTextRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OverflowDetectableTextPage();
}

class OverflowDetectableTextPage extends StatelessWidget {
  const OverflowDetectableTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
        ),
        body: ListView.separated(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(height: 0),
          itemBuilder: (context, index) => Cell(Data.index(index)),
        ),
      ),
    );
  }

  ThemeData _buildTheme() {
    final base = ThemeData.light();
    const accentColor = Color(0xFF007AFF);
    const buttonColor = Color(0xFFF0F0F7);
    final highlightColor = accentColor.withOpacity(0.04);
    return base.copyWith(
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: accentColor,
      ),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      highlightColor: highlightColor,
//      splashColor: splashColor,
      primaryTextTheme: base.primaryTextTheme.apply(
        bodyColor: Colors.black87,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 1,
      ),
      dividerColor: Colors.black26,
      textTheme: base.textTheme.copyWith(
        bodyMedium: base.textTheme.bodyMedium!.copyWith(fontSize: 13),
        labelLarge: base.textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: accentColor, shape: const StadiumBorder(),
          backgroundColor: buttonColor,
          // shadowColor: highlightColor,
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 7,
          ),
        ).copyWith(
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(
            Color.lerp(
              buttonColor,
              Colors.black,
              0.3,
            ),
          ),
        ),
      ),
      primaryIconTheme: base.primaryIconTheme.copyWith(
        color: accentColor,
      ),
    );
  }
}
