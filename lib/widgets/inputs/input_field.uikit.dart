import 'package:dash_kit_uikit/dash_kit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:fsof/utils/validators.dart';
import 'package:fsof/widgets/inputs/input_field.dart';
import 'package:fsof/widgets/inputs/input_field_props.dart';

class InputFieldUiKitBuilder extends UiKitBuilder {
  @override
  Type get componentType => InputField;

  @override
  void buildComponentStates() {
    build(
      'Input with text',
      InputField(
        props: InputFieldProps(
          hint: 'Hint',
          focusNode: FocusNode(),
        ),
      ),
    );
    build(
      'Input with obscure text',
      InputField(
        props: InputFieldProps(
          hint: 'Hint',
          keyboardType: TextInputType.number,
          obscureText: true,
          focusNode: FocusNode(),
        ),
      ),
    );
    build(
      'email',
      InputField(
        props: InputFieldProps(
          hint: 'Hint',
          controller: TextEditingController(text: 'Email'),
          focusNode: FocusNode(),
        ),
      ),
    );
    build(
      'Wrong email',
      InputField(
        props: InputFieldProps(
          hint: 'Hint',
          controller: TextEditingController(text: 'Email'),
          autovalidateMode: AutovalidateMode.always,
          validatorRules: [FormatResult((_) => true, 'Wrong email')],
          focusNode: FocusNode(),
        ),
      ),
    );
    build(
      'Multiline',
      InputField(
        props: InputFieldProps(
          hint: 'Hint',
          maxLines: 2,
          focusNode: FocusNode(),
        ),
      ),
    );
    build(
      'Another border',
      InputField(
        props: InputFieldProps(
          hint: 'Hint',
          maxLines: 1,
          inputBorder: const OutlineInputBorder(),
          focusNode: FocusNode(),
        ),
      ),
    );
  }
}
