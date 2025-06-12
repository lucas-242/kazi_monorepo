import 'package:kazi_companies/core/routes/routes.dart';

abstract interface class IUrlUtils {
  AppPages getInitialMenu();
  void updateUrl(String url);
}
