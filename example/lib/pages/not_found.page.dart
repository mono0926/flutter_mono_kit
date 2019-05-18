import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
      body: Center(
        child: Image.network(
            'https://i0.wp.com/hokanko.mond.jp/wordpress341/wp-content/uploads/images/istock_hannah.jpg'),
      ),
    );
  }
}
