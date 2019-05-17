import 'package:flutter/material.dart';

class VerticalCenterScrollView extends StatefulWidget {
  const VerticalCenterScrollView({
    Key key,
    @required this.child,
    this.autoPop = false,
    this.hasCloseButton = false,
  }) : super(key: key);

  final Widget child;
  final bool autoPop;
  final bool hasCloseButton;

  @override
  _VerticalCenterScrollViewState createState() =>
      _VerticalCenterScrollViewState();
}

class _VerticalCenterScrollViewState extends State<VerticalCenterScrollView> {
  ScrollController _controller;
  bool _isPopping = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        if (!widget.autoPop || _isPopping) {
          return;
        }
        final query = MediaQuery.of(context);
        if (-_controller.offset > query.size.height * 0.18) {
          _isPopping = true;
          Navigator.of(context).pop();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              controller: _controller,
              // 中身の高さによらず常にバウンスさせる
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                // 最小高さを親の高さと一緒にする
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Center(
                  child: widget.child,
                ),
              ),
            );
          },
        ),
        Visibility(
          visible: widget.hasCloseButton,
          child: Positioned(
            top: -6,
            left: -6,
            child: Material(
              color: Colors.transparent,
              child: SafeArea(
                bottom: false,
                child: Container(
                  width: Material.defaultSplashRadius * 2,
                  height: Material.defaultSplashRadius * 2,
                  child: IconTheme(
                    child: const CloseButton(),
                    data: Theme.of(context).primaryIconTheme,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
