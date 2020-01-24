import 'package:example/pages/banner_visibility_page.dart';
import 'package:example/pages/better_placeholder_page.dart';
import 'package:example/pages/color_ex_page.dart';
import 'package:example/pages/life_cycle_observer_page.dart';
import 'package:example/pages/max_width_padding_builder_page.dart';
import 'package:example/pages/overflow_detectable_text_page/overflow_detectable_text_page.dart';
import 'package:example/pages/paging_scroll_page.dart';
import 'package:example/pages/progress_mixin_page.dart';
import 'package:example/pages/text_input_dialog_page.dart';
import 'package:example/pages/unfocus_on_tap_page.dart';
import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:mono_kit/plugins/plugins.dart';

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
            title: const Text(LifeCycleObserverPage.routeName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(LifeCycleObserverPage.routeName);
            },
          ),
          ListTile(
            title: const Text('ProgressMixin'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(ProgressMixinPage.routeName);
            },
          ),
          ListTile(
            title: const Text('UnfocusOnTap'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(UnfocusOnTapPage.routeName);
            },
          ),
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
          ListTile(
            title: const Text(PagingScrollPage.routeName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(PagingScrollPage.routeName);
            },
          ),
          ListTile(
            title: const Text(BannerVisibilityPage.routeName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(BannerVisibilityPage.routeName);
            },
          ),
          ListTile(
            title: const Text(ColorExPage.routeName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(ColorExPage.routeName);
            },
          ),
          ListTile(
            title: const Text(TextInputDialogPage.routeName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(TextInputDialogPage.routeName);
            },
          ),
          ListTile(
            title: const Text(MaxWidthPaddingBuilderPage.routeName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(MaxWidthPaddingBuilderPage.routeName);
            },
          ),
          ListTile(
            title: const Text(BetterPlaceholderPage.routeName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pushNamed(BetterPlaceholderPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
