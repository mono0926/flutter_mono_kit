import 'dart:async';

import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mono_kit/mono_kit.dart';

class LoadingSwitcherRoute extends GoRouteData with $LoadingSwitcherRoute {
  const LoadingSwitcherRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoadingSwitcherPage();
}

final AsyncNotifierProvider<_Controller, Image> _controller =
    AsyncNotifierProvider(_Controller.new);

class LoadingSwitcherPage extends ConsumerWidget {
  const LoadingSwitcherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueAsync = ref.watch(_controller);
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteUri(GoRouterState.of(context).uri)),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: LoadingSwitcher(
              timeout: ref.watch(
                _controller.select(
                  (model) => ref.watch(_durationProvider)[SliderType.timeout]!,
                ),
              ),
              child: valueAsync.isLoading ? null : valueAsync.value,
            ),
          ),
          const SizedBox(height: 48),
          const _Slider(type: SliderType.loading),
          const _Slider(type: SliderType.timeout),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(_controller);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _Slider extends ConsumerWidget {
  const _Slider({
    required this.type,
  });

  final SliderType type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      _durationProvider.select(
        (duration) => duration[type]!.inMilliseconds.toDouble(),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Text(type.label),
          Expanded(
            child: Slider(
              max: 1000,
              value: value,
              label: '$value',
              divisions: 100,
              onChanged: (value) {
                ref
                    .read(_durationProvider.notifier)
                    .updateDuration(
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

final _durationProvider =
    NotifierProvider<_DurationNotifier, Map<SliderType, Duration>>(
      _DurationNotifier.new,
    );

class _DurationNotifier extends Notifier<Map<SliderType, Duration>> {
  @override
  Map<SliderType, Duration> build() => <SliderType, Duration>{
    SliderType.loading: const Duration(milliseconds: 500),
    SliderType.timeout: const Duration(milliseconds: 500),
  };

  void updateDuration({
    required SliderType sliderType,
    required Duration duration,
  }) {
    state = {
      ...state,
      sliderType: duration,
    };
  }
}

class _Controller extends AsyncNotifier<Image> {
  Image? _image;
  Image? get image => _image;

  Duration getDuration({required SliderType sliderType}) =>
      ref.read(_durationProvider)[sliderType]!;

  @override
  FutureOr<Image> build() async {
    await Future<void>.delayed(getDuration(sliderType: SliderType.loading));
    return Image.asset('assets/images/love.png');
  }
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
