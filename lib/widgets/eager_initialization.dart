import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

class EagerInitialization extends ConsumerWidget {
  const EagerInitialization({
    super.key,
    required this.child,
    required this.providers,
  });

  final Widget child;
  final List<ProviderListenable<dynamic>> providers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    providers.forEach(ref.watch);
    return child;
  }
}
