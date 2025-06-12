import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/core/routes/url_utils/i_url_utils.dart';
import 'package:web/web.dart';

class UrlUtils implements IUrlUtils {
  UrlUtils() {
    setUrlStrategy(PathUrlStrategy());
  }

  @override
  AppPages getInitialMenu() {
    final url = Uri.base.path.toLowerCase();
    return AppPages.fromRoute(url) ?? AppPages.home;
  }

  @override
  void updateUrl(String url) => window.history.pushState(null, '', url);
}
