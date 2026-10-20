import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

extension RefEx on Ref {
  Future<T> readAsync<T>(Refreshable<Future<T>> future) async {
    final sub = listen(future, (_, _) {});
    try {
      return await sub.read();
    } finally {
      sub.close();
    }
  }
}
