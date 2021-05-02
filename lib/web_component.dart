import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebComponent extends StatelessWidget {
  const WebComponent({
    Key key,
    @required this.name,
    @required this.bundle,
    this.title = '',
  }) : super(key: key);
  final String name, bundle, title;

  String get source => '''<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$title</title>
    <style>
      body {
        padding: 0;
        margin: 0;
      }
      $name {
        width: 100%;
        height: 100vh;
      }
    </style>
  <script type="module" crossorigin src="$bundle"></script>
</head>
  <body>
    <$name></$name>
  </body>
</html> 
        ''';

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(cacheEnabled: false),
      ),
      initialData: InAppWebViewInitialData(data: source),
    );
  }
}
