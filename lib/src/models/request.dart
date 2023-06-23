import 'package:flutter/material.dart';

class Request extends ChangeNotifier {
  Request(this.url);

  final String url;

  void fetch() {
    debugPrint(url);
  }
}
