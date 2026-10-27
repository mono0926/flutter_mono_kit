import 'package:material_ui/material_ui.dart';

class const VerticalCenterScrollView({
  super.key,
  required final Widget child,
  final EdgeInsets? padding,
  final bool autoPop = false,
  final bool hasCloseButton = false,
}) extends StatefulWidget {
  @override
  State<VerticalCenterScrollView> createState() =>
      _VerticalCenterScrollViewState();
}

class _VerticalCenterScrollViewState() extends State<VerticalCenterScrollView> {
  late final ScrollController _controller;
  var _isPopping = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        if (!widget.autoPop || _isPopping) {
          return;
        }
        if (-_controller.offset > MediaQuery.sizeOf(context).height * 0.18) {
          _isPopping = true;
          Navigator.of(context).pop();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final verticalPadding = widget.padding?.vertical ?? 0;
            return SingleChildScrollView(
              padding: widget.padding,
              controller: _controller,
              // 中身の高さによらず常にバウンスさせる
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                // 最小高さを親の高さと一緒にする
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - verticalPadding,
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
                child: SizedBox(
                  width: Material.defaultSplashRadius * 2,
                  height: Material.defaultSplashRadius * 2,
                  child: IconTheme(
                    data: Theme.of(context).primaryIconTheme,
                    child: const CloseButton(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
