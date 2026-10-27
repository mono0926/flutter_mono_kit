class Data._({
  required final String desc,
}) {
  new small()
    : this._(
        desc: 'Flutter最高！',
      );
  new medium()
    : this._(
        desc: 'むかしむかし、あるところにFlutterという素晴らしいフレームワークがありました。',
      );

  // Copied from https://ja.wikipedia.org/wiki/Flutter
  new large()
    : this._(
        desc:
            'Flutter（フラッター）は、Googleによって開発されたフリーかつ'
                'オープンソースのモバイルアプリケーションフレームワークである。' *
            2,
      );

  factory index(int index) {
    switch (index % 3) {
      case 0:
        return Data.small();
      case 1:
        return Data.medium();
      case 2:
        return Data.large();
    }
    assert(false);
    return Data._(desc: '');
  }
}
