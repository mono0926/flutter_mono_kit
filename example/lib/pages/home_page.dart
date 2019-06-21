import 'package:example/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/plugins/plugins.dart';
import 'package:mono_kit/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          ListTile(
            title: const Text('OverflowDetectableText'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(OverflowDetectableTextPage.routeName);
            },
          ),
          ListTile(
            title: const Text('iGhost(Dev) installed?'),
            subtitle: FutureBuilder<bool>(
              future: AppInstallationChecker()
                  .isInstalled('com.aquatica.ghost.dev'),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const SizedBox();
                }
                return Text(snap.data.toString());
              },
            ),
          ),
          ListTile(
            title: const Text('TextAnswerDialog'),
            onTap: () async {
              final ok = await TextAnswerDialog.show(
                context: context,
                title: '今日は何の日？',
                message: '今日は何の日か入力して「OK」ボタンを押してください。',
                keyword: '華金',
                hintText: '何の日？',
                okButtonLabel: 'OK',
                retryTitle: '不正解です(　´･‿･｀)',
                retryMessage: 'リトライしますか？',
                retryButtonLabel: 'リトライ',
              );
              print('ok: $ok');
              if (!ok) {
                return;
              }
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('正解です、帰りましょう🍻'),
                  actions: [
                    FlatButton(
                      child: const Text('帰る'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
