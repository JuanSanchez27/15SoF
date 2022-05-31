import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/utils/constants/constants.dart';
import 'package:fsof/ui/widgets/bars/fsof_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends HookWidget {
  WebViewScreen({
    required this.path,
    required this.title,
  });

  final String title;
  final String path;

  static Route goToPrivacyPolicy() => MaterialPageRoute(
    builder: (_) => WebViewScreen(
      title: I18n.of(_).sWebViewPrivacyPolicyTitle,
      path: kHtmlPrivacyPolicy,
    ),
    settings: const RouteSettings(name: kRouteLoginMobile),
  );

  static Route goToTermsOfUse() => MaterialPageRoute(
    builder: (_) => WebViewScreen(
      title: I18n.of(_).sWebViewTermsOfUseTitle,
      path: kHtmlTermsOfUse,
    ),
    settings: const RouteSettings(name: kRouteLoginMobile),
  );

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);
    final fileText = useState('');
    

    return Scaffold(
      appBar: FsofAppBar.withTitleAndBack(title: title),
      body: Padding(
        padding: const EdgeInsets.all(kDimens16),
        child: Container(
          //isLoading: isLoading.value,
          //backgroundColor: kBackgroundColor,
          child: fileText.value.isEmpty
              ? const SizedBox()
              : WebView(
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: <JavascriptChannel>{
                  JavascriptChannel(
                      name: 'MessageInvoker',
                      onMessageReceived: (s) {
                      print(s);
                      }),
                },
                  initialUrl: Uri.dataFromString(
                    fileText.value,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'),
                  ).toString(),
                  onPageFinished: (_) => isLoading.value = false,
                ),
        ),
      ),
    );
  }
}
