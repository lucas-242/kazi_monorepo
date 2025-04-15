import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/buttons/kazi_back_and_pill.dart';
import 'package:kazi_core/shared/components/loading/kazi_loading.dart';
import 'package:kazi_core/shared/themes/themes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(KaziColors.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) => const KaziLoading(),
        ),
      )
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            KaziSpacings.verticalMd,
            KaziBackAndPill(text: title),
            KaziSpacings.verticalMd,
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: KaziColors.background,
        titleSpacing: KaziInsets.lg,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
