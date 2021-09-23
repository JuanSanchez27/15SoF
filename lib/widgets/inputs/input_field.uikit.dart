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
      const InputField(
        props: InputFieldProps(
          hint: 'Hint',
        ),
      ),
    );
    build(
      'Input with obscure text',
      const InputField(
        props: InputFieldProps(
          hint: 'Hint',
          keyboardType: TextInputType.number,
          obscureText: true,
        ),
      ),
    );
    build(
      'email',
      InputField(
        props: InputFieldProps(
          hint: 'Hint',
          controller: TextEditingController(text: 'Email'),
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
        ),
      ),
    );
    build(
      'Multiline',
      const InputField(
        props: InputFieldProps(
          hint: 'Hint',
          maxLines: 2,
        ),
      ),
    );
    build(
      'Another border',
      const InputField(
        props: InputFieldProps(
          hint: 'Hint',
          maxLines: 1,
          inputBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}
