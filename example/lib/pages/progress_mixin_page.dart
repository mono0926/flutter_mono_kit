import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';

class ProgressMixinPage extends StatelessWidget {
  const ProgressMixinPage._({Key key}) : super(key: key);

  static Widget withModel() {
    return ChangeNotifierProvider(
      create: (context) => _Model(),
      child: const ProgressMixinPage._(),
    );
  }

  static const routeName = '/progress_mixin';
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_Model>(context, listen: false);
    return Barrier(
      showProgress: model.inProgress,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(routeName),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: model.increment,
        ),
        body: const Center(child: _Counter()),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<_Model>(context).count.toString(),
      style: Theme.of(context).textTheme.display1,
    );
  }
}

// ignore: lines_longer_than_80_chars
// TOOD(mono): ChangeNotifierのdisposeを奪ってしまって呼ばれない問題。ProgressMixinのdisposeをやめて明示的に呼ぶ作りにするべきかも？
class _Model extends ChangeNotifier with ProgressMixin {
  var _count = 0;

  int get count => _count;

  void increment() {
    executeWithProgress(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      _count++;
      notifyListeners();
    });
  }
}
