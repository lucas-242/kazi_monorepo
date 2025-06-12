import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/core/routes/url_utils/i_url_utils.dart';

class UrlUtils implements IUrlUtils {
  @override
  AppPages getInitialMenu() => AppPages.home;

  @override
  void updateUrl(String url) {}
}
