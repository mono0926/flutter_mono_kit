import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

import 'data.dart';

const double _defaultMaxHeight = 110;

class Cell extends StatefulWidget {
  const Cell(this.data);

  final Data data;

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  Animation<double>? _maxHeight;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: _maxHeight?.value ?? _defaultMaxHeight),
              child: child,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildIcon(context),
                      const SizedBox(width: 8),
                      _buildTitle(context),
                    ],
                  ),
                  _buildOpenButton(context),
                ],
              ),
              const SizedBox(height: 12),
              Flexible(
                child: _Desc(
                  data: widget.data,
                  additionalHeightNeeded: (additionalHeight) {
                    if (additionalHeight == 0) {
                      return;
                    }
                    _maxHeight = _animation.drive<double>(Tween<double>(
                      begin: _defaultMaxHeight,
                      end: _defaultMaxHeight + additionalHeight,
                    ));

                    _animation.forward();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: theme.dividerColor,
          width: 1 / MediaQuery.of(context).devicePixelRatio,
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: const FlutterLogo(),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter',
          style: theme.textTheme.subtitle1,
        ),
        const SizedBox(height: 4),
        Text(
          'Today',
          style: theme.textTheme.caption,
        ),
      ],
    );
  }

  Widget _buildOpenButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('OPEN'),
      onPressed: () {},
    );
  }
}

class _Desc extends StatefulWidget {
  const _Desc({
    Key? key,
    required this.data,
    required this.additionalHeightNeeded,
  }) : super(key: key);

  final Data data;
  final Function(double height) additionalHeightNeeded;

  @override
  __DescState createState() => __DescState();
}

class __DescState extends State<_Desc> {
  final _overflowNotifier = ValueNotifier<double>(0);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.scaffoldBackgroundColor;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        OverflowDetectableText(
          widget.data.desc,
          style: theme.textTheme.bodyText2!,
          detector: (overflow) => _overflowNotifier.value = overflow,
//                maxLines: 2,
        ),
        Positioned(
          right: -2,
          bottom: -2,
          child: ValueListenableBuilder<double>(
            valueListenable: _overflowNotifier,
            builder: (context, overflow, child) {
              return Visibility(
                visible: overflow > 0,
                child: child!,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    backgroundColor.withOpacity(0.01),
                    ...List.generate(2, (_) => backgroundColor)
                  ],
                ),
              ),
              padding: const EdgeInsets.only(left: 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.all(4),
                  primary: Colors.transparent,
                ),
                onPressed: () =>
                    widget.additionalHeightNeeded(_overflowNotifier.value),
                child: Text(
                  'more',
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: theme.accentColor),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
