import 'package:dash_kit_uikit/dash_kit_uikit.dart';
import 'package:fsof/widgets/texts/link_text.dart';

class LinkTextUiKitBuilder extends UiKitBuilder {
  @override
  Type get componentType => LinkText;

  @override
  void buildComponentStates() {
    build(
      'Just Link',
      const LinkText(
        texts: ['Link'],
      ),
    );
    build(
      'Just Link with common text before link',
      LinkText(
        texts: [
          'Not linked part',
          ClickableText(text: 'Link', onPressed: () {}),
        ],
      ),
    );
    build(
      'Just Link with common text after link',
      LinkText(
        texts: [
          ClickableText(text: 'Link', onPressed: () {}),
          'Not linked part',
        ],
      ),
    );
    build(
      'Just Link with both texts before and after link',
      LinkText(
        texts: [
          ClickableText(text: 'Not linked part', onPressed: () {}),
          'Link',
          ClickableText(text: 'Not linked part', onPressed: () {}),
        ],
      ),
    );
  }
}
