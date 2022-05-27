import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mono_kit/mono_kit.dart';

class LoadingSwitcherRoute extends GoRouteData {
  const LoadingSwitcherRoute();
  @override
  Widget build(BuildContext context) => const LoadingSwitcherPage();
}

final _controller = ChangeNotifierProvider((ref) => _Controller());

class LoadingSwitcherPage extends ConsumerWidget {
  const LoadingSwitcherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(GoRouter.of(context).location)),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: LoadingSwitcher(
              timeout: ref.watch(
                _controller.select(
                  (_Controller model) => model.getDuration(
                    sliderType: SliderType.timeout,
                  ),
                ),
              ),
              child: ref.watch(
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
          ref.watch(_controller).reload();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _Slider extends ConsumerWidget {
  const _Slider({
    Key? key,
    required this.type,
  }) : super(key: key);

  final SliderType type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
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
                ref.read(_controller).updateDuration(
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
  Image? _image;
  Image? get image => _image;

  final _durations = {
    SliderType.loading: const Duration(milliseconds: 500),
    SliderType.timeout: const Duration(milliseconds: 500),
  };

  Future<void> reload() async {
    _image = null;
    notifyListeners();
    await Future<void>.delayed(getDuration(sliderType: SliderType.loading));
    _image = Image.asset('assets/images/love.png');
    notifyListeners();
  }

  void updateDuration({
    required SliderType sliderType,
    required Duration duration,
  }) {
    _durations[sliderType] = duration;
    notifyListeners();
  }

  Duration getDuration({required SliderType sliderType}) =>
      _durations[sliderType]!;
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
  }
}
