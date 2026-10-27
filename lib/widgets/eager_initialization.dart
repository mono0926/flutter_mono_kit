import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

class const EagerInitialization({
  super.key,
  required final Widget child,
  required final List<ProviderListenable<dynamic>> providers,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    providers.forEach(ref.watch);
    return child;
  }
}
