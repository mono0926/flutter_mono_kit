import 'package:flutter/foundation.dart';

class Data {
  Data._({
    @required this.desc,
  });

  Data.small()
      : this._(
          desc: 'Flutter最高！',
        );
  Data.medium()
      : this._(
          desc: 'むかしむかし、あるところにFlutterという素晴らしいフレームワークがありました。',
        );

  // Copied from https://ja.wikipedia.org/wiki/Flutter
  Data.large()
      : this._(
            desc: 'Flutter（フラッター）は、Googleによって開発されたフリーかつ'
                    'オープンソースのモバイルアプリケーションフレームワークである。' *
                2);

  factory Data.index(int index) {
    switch (index % 3) {
      case 0:
        return Data.small();
      case 1:
        return Data.medium();
      case 2:
        return Data.large();
    }
    assert(false);
    return null;
  }

  final String desc;
}
