import 'package:meta/meta.dart';

class Data {
  Data._({
    @required this.desc,
  });

  final String desc;

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
              'オープンソースのモバイルアプリケーションフレームワークである。'
              'FlutterはAndroidやiOS向けのアプリケーションの開発に利用されている。'
              'Fuchsiaではアプリケーションの開発は主にFlutterを利用して行われている[4]。',
        );

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
}