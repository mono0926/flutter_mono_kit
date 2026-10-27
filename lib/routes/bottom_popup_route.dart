import 'dart:math' show min;

import 'package:material_ui/material_ui.dart';
import 'package:nested/nested.dart';

class BottomPopupRoute<T>({
  required final WidgetBuilder builder,
  super.settings,
  @override final String barrierLabel = 'Dismiss',
  @override final Color barrierColor = const Color(0x80000000),
  final EdgeInsetsGeometry? padding,
}) extends PopupRoute<T> {
  @override
  final barrierDismissible = true;

  @override
  final transitionDuration = const Duration(milliseconds: 400);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final height = MediaQuery.sizeOf(context).height;
    final paddingV = MediaQuery.paddingOf(context).vertical;
    final maxHeight = height - paddingV - 24;
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          _Pan(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8).copyWith(top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  padding: padding ?? const EdgeInsets.all(16),
                  child: Material(
                    color: Colors.transparent,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: maxHeight),
                      child: builder(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation
          .drive(
            // isCurrent: true -> push | false -> pop
            CurveTween(
              curve: isCurrent ? const ElasticOutCurve(0.8) : Curves.easeInOut,
            ),
          )
          .drive(
            Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ),
          ),
      child: child,
    );
  }
}

class const _Pan({
  required Widget super.child,
}) extends SingleChildStatefulWidget {
  @override
  _PanState createState() => _PanState();
}

class _PanState() extends SingleChildState<_Pan> {
  double _offsetY = 0;
  double _lastOffsetY = 0;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final height = MediaQuery.sizeOf(context).height;
    final panThreshold = height * 0.2;
    return AnimatedPositioned(
      duration: Duration(
        milliseconds: _offsetY == 0 ? (_lastOffsetY * 0.3).toInt().abs() : 0,
      ),
      left: 0,
      right: 0,
      bottom: -_offsetY,
      child: GestureDetector(
        onPanUpdate: (g) {
          var delta = g.delta.dy;
          if (_offsetY <= 0 && delta < 0) {
            delta = delta * min(0.3, 10 / _offsetY.abs());
          }
          setState(() {
            _offsetY += delta;
          });
        },
        onPanEnd: (g) {
          if (_offsetY > panThreshold) {
            Navigator.of(context).pop();
          } else {
            _cancel();
          }
        },
        onPanCancel: _cancel,
        child: child,
      ),
    );
  }

  void _cancel() {
    setState(() {
      _lastOffsetY = _offsetY;
      _offsetY = 0;
    });
  }
}
