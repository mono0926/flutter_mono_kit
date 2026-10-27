import 'package:material_ui/material_ui.dart';

class const NotFoundPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
      body: Center(
        child: Image.network(
          'https://i0.wp.com/hokanko.mond.jp/wordpress341/wp-content/uploads/images/istock_hannah.jpg',
        ),
      ),
    );
  }
}
