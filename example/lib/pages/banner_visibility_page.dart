import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

class BannerVisibilityPage extends StatefulWidget {
  const BannerVisibilityPage({Key key}) : super(key: key);

  static const routeName = '/banner_visibility';

  @override
  _BannerVisibilityPageState createState() => _BannerVisibilityPageState();
}

class _BannerVisibilityPageState extends State<BannerVisibilityPage> {
  final _isVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(BannerVisibilityPage.routeName),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _isVisible,
            builder: (context, isVisible, child) {
              return AnimatedExpansionVisibility(
                isVisible: isVisible,
                child: child,
              );
            },
            child: MaterialBanner(
              content: const Text('This is a banner. Dismiss me'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async => _isVisible.value = false,
                  child: const Text('DISMISS'),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            color: Colors.blue,
            child: const Text('A Container'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _isVisible.value = !_isVisible.value,
      ),
    );
  }
}
