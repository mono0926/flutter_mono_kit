import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class BannerVisibilityPage extends StatelessWidget {
  const BannerVisibilityPage({Key key}) : super(key: key);

  static const routeName = '/banner_visibility';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
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
  final _isVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ValueListenableBuilder<bool>(
          valueListenable: _isVisible,
          builder: (context, isVisible, child) {
            return AnimatedExpansionVisibility(
              isVisible: isVisible,
              child: MaterialBanner(
                content: const Text('This is a banner. Dismiss me'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () async => _isVisible.value = false,
                    child: const Text('DISMISS'),
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          height: 200,
          alignment: Alignment.center,
          color: Colors.blue,
          child: const Text('A Container'),
        ),
        RaisedButton(
          child: Text('TOGGLE'),
          onPressed: () => _isVisible.value = !_isVisible.value,
        )
      ],
    );
  }
}
