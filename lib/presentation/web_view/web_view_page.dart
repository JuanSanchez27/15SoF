import 'dart:convert';
import 'dart:io';

import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/htmls.dart';
import 'package:fsof/resources/strings.dart';
import 'package:fsof/widgets/bars/sof_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends HookWidget {
  const WebViewPage._({
    required this.path,
    required this.title,
    Key? key,
  }) : super(key: key);

  factory WebViewPage.privacyPolicy() {
    return WebViewPage._(
      title: Strings.privacyPolicyTitle,
      path: Htmls.privacyPolicy,
    );
  }

  factory WebViewPage.termsOfUse() {
    return WebViewPage._(
      title: Strings.termsOfUseTitle,
      path: Htmls.termsOfUse,
    );
  }

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);
    final fileText = useState('');
    useEffect(() {
      if (Platform.isAndroid) {
        WebView.platform = SurfaceAndroidWebView();
      }

      rootBundle.loadString(path).then((value) => fileText.value = value);

      return;
    }, []);

    return Scaffold(
      appBar: SofAppBar.withTitleAndBack(title: title),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LoadableView(
          isLoading: isLoading.value,
          backgroundColor: ColorRes.ebonyClay,
          child: fileText.value.isEmpty
              ? const SizedBox()
              : WebView(
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
