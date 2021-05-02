import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebComponent extends StatelessWidget {
  const WebComponent({
    Key key,
    @required this.name,
    @required this.bundle,
    this.attributes = const {},
    this.slot = '',
    this.events = const [],
  }) : super(key: key);
  final String name, bundle;
  final Map<String, String> attributes;
  final String slot;
  final List<EventCallback> events;

  String get source {
    return '''<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <$name ${attributes.entries.map((e) => '${e.key}="${e.value}"').join(' ')}>
      $slot
    </$name>
    <script>
    window.addEventListener("flutterInAppWebViewPlatformReady", (event) => {
      ${events.join('\n')}
    });
    </script>
  </body>
</html> 
''';
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialData: InAppWebViewInitialData(data: source),
      onWebViewCreated: (controller) {
        for (final event in events)
          controller.addJavaScriptHandler(
            handlerName: event.query,
            callback: event.onPressed,
          );
      },
    );
  }
}

class EventCallback {
  EventCallback({
    @required this.onPressed,
    @required this.event,
    this.query,
  });
  final String query, event;
  final dynamic Function(List<dynamic> args) onPressed;

  @override
  String toString() {
    final prefix =
        query == null ? 'document.body' : 'document.querySelector("$query")';
    return '''
$prefix.addEventListener("$event", (e) => {
  window.flutter_inappwebview.callHandler("$query", e);
}, false);
''';
  }
}
