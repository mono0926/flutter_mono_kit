import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

final _controller = ChangeNotifierProvider((ref) => _Controller());

class LoadingSwitcherPage extends HookWidget {
  const LoadingSwitcherPage({Key key}) : super(key: key);

  static const routeName = '/loading_switcher';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LoadingSwitcherPage.routeName),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: LoadingSwitcher(
              timeout: useProvider(
                _controller.select(
                  (_Controller model) => model.getDuration(
                    sliderType: SliderType.timeout,
                  ),
                ),
              ),
              child: useProvider(
                _controller.select((_Controller model) => model.image),
              ),
            ),
          ),
          const SizedBox(height: 48),
          const _Slider(type: SliderType.loading),
          const _Slider(type: SliderType.timeout),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(_controller).reload();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _Slider extends HookWidget {
  const _Slider({
    Key key,
    @required this.type,
  }) : super(key: key);

  final SliderType type;
  @override
  Widget build(BuildContext context) {
    final value = useProvider(
      _controller.select((_Controller model) =>
          model.getDuration(sliderType: type).inMilliseconds.toDouble()),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Text(type.label),
          Expanded(
            child: Slider(
              min: 0,
              max: 1000,
              value: value,
              label: '$value',
              divisions: 100,
              onChanged: (value) {
                context.read(_controller).updateDuration(
                      sliderType: type,
                      duration: Duration(
                        milliseconds: value.toInt(),
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Controller with ChangeNotifier {
  _Controller() {
    reload();
  }

  final _durations = {
    SliderType.loading: const Duration(milliseconds: 500),
    SliderType.timeout: const Duration(milliseconds: 500),
  };

  Image _image;
  Image get image => _image;

  Future<void> reload() async {
    _image = null;
    notifyListeners();
    await Future<void>.delayed(getDuration(sliderType: SliderType.loading));
    _image = Image.asset('assets/images/love.png');
    notifyListeners();
  }

  void updateDuration({
    @required SliderType sliderType,
    @required Duration duration,
  }) {
    _durations[sliderType] = duration;
    notifyListeners();
  }

  Duration getDuration({@required SliderType sliderType}) =>
      _durations[sliderType];
}

enum SliderType {
  loading,
  timeout,
}

extension SliderTypeEx on SliderType {
  String get label {
    switch (this) {
      case SliderType.loading:
        return 'Loading(ms)';
      case SliderType.timeout:
        return 'Timeout(ms)';
    }
    assert(false);
    return null;
  }
}
