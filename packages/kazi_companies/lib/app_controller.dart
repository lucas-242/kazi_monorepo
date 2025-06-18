import 'package:kazi_companies/core/routes/app_pages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';

@riverpod
class AppController extends _$AppController {
  @override
  AppPages build() => AppPages.home;

  void changePage(AppPages newPage) {
    state = newPage;
  }
}
