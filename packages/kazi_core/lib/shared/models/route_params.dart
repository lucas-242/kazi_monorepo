import 'package:kazi_core/shared/entities/service.dart';

class RouteParams {
  const RouteParams({
    this.id,
    this.service,
    this.token,
    this.webViewParams,
  });

  final Service? service;
  final int? id;
  final String? token;
  final WebViewParams? webViewParams;
}

class WebViewParams {
  WebViewParams(this.title, this.url);

  final String title;
  final String url;
}
