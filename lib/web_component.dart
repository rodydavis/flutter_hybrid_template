import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebComponent extends StatefulWidget {
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

  @override
  _WebComponentState createState() => _WebComponentState();
}

class _WebComponentState extends State<WebComponent> {
  InAppWebViewController controller;
  final Map<String, List<EventCallback>> _events = {};

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
      ${widget.name} {
        width: 100%;
        height: 100vh;
      }
    </style>
  <script type="module" crossorigin src="${widget.bundle}"></script>
</head>
  <body>
    <${widget.name} ${widget.attributes.entries.map((e) => '${e.key}="${e.value}"').join(' ')}>
      ${widget.slot}
    </${widget.name}>
    <script>
    window.addEventListener("flutterInAppWebViewPlatformReady", (event) => {
      ${widget.events.join('\n')}
    });
    </script>
  </body>
</html> 
''';
  }

  void _setup(InAppWebViewController controller) {
    this.controller = controller;
    this._setupEvents();
  }

  void _setupEvents() {
    for (final event in _events.keys) {
      controller.removeJavaScriptHandler(handlerName: event);
    }
    for (final event in widget.events) {
      _addEvent(event);
    }
  }

  void _addEvent(EventCallback event) {
    controller.addJavaScriptHandler(
      handlerName: event.query,
      callback: event.onPressed,
    );
    _events[event.event] ??= [];
    _events[event.event].add(event);
  }

  @override
  void didUpdateWidget(covariant WebComponent oldWidget) {
    if (oldWidget.events != widget.events) {
      _setupEvents();
    }
    if (oldWidget.slot != widget.slot ||
        oldWidget.bundle != widget.bundle ||
        oldWidget.name != widget.name) {
      controller.loadData(data: source);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialData: InAppWebViewInitialData(data: source),
      onWebViewCreated: _setup,
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
  String toString() => _source;

  String get _prefix => query != null && query.isNotEmpty
      ? 'document.querySelector("$query")'
      : 'document.body';

  String get _source => [
        '$_prefix.addEventListener("$event", (e) => {',
        '  window.flutter_inappwebview.callHandler("$query", e);',
        '}, false);',
      ].join('\n');
}
