import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cell.dart';
import 'data.dart';

class OverflowDetectableTextPage extends StatelessWidget {
  const OverflowDetectableTextPage({Key? key}) : super(key: key);

  static const routeName = '/OverflowDetectableText';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(routeName),
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
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: base.primaryTextTheme.apply(
        bodyColor: Colors.black87,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 1,
      ),
      dividerColor: Colors.black26,
      textTheme: base.textTheme.copyWith(
        bodyText2: base.textTheme.bodyText2!.copyWith(fontSize: 13),
        button: base.textTheme.button!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          onPrimary: accentColor,
          primary: buttonColor,
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
