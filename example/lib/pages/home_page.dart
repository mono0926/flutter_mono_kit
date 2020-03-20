import 'package:example/pages/banner_visibility_page.dart';
import 'package:example/pages/barrier_page.dart';
import 'package:example/pages/better_placeholder_page.dart';
import 'package:example/pages/color_ex_page.dart';
import 'package:example/pages/life_cycle_observer_page.dart';
import 'package:example/pages/max_width_padding_builder_page.dart';
import 'package:example/pages/overflow_detectable_text_page/overflow_detectable_text_page.dart';
import 'package:example/pages/paging_scroll_page.dart';
import 'package:example/pages/text_input_dialog_page.dart';
import 'package:example/pages/unfocus_on_tap_page.dart';
import 'package:example/router.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/plugins/plugins.dart';

import 'loading_switcher_page.dart';

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
          ...PageInfo.all.map((info) {
            final routeName = info.routeName;
            return ListTile(
              title: Text(pascalCaseFromRouteName(routeName)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).pushNamed(routeName),
            );
          }),
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
              await showDialog<void>(
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
          ),
        ],
      ),
    );
  }
}
