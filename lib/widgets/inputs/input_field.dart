import 'package:flutter/material.dart';
import 'package:fsof/resources/colors.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/utils/validators.dart';
import 'package:fsof/widgets/inputs/input_field_props.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.props,
    Key? key,
  }) : super(key: key);

  final InputFieldProps props;

  @override
  State<StatefulWidget> createState() {
    return _InputFieldState();
  }
}

class _InputFieldState extends State<InputField> {
  final key = GlobalKey<FormFieldState>();
  bool isObscure = false;

  bool get _hasFocus => widget.props.focusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    widget.props.focusNode.addListener(_changeFieldFocus);

    isObscure = widget.props.obscureText;
  }

  @override
  void dispose() {
    widget.props.focusNode.removeListener(_changeFieldFocus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        key: key,
        enabled: widget.props.isEnabled,
        initialValue: widget.props.controller?.text ?? '',
        validator: _validate,
        onSaved: (value) => widget.props.focusNode.unfocus(),
        autovalidateMode: widget.props.autovalidateMode,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                maxLines: widget.props.maxLines,
                controller: widget.props.controller,
                focusNode: widget.props.focusNode,
                readOnly: widget.props.readOnly,
                textInputAction: widget.props.textInputAction,
                textAlign: widget.props.textAlign,
                onSubmitted: _submitField,
                style: widget.props.style ??
                    Styles.p1.copyWith(color: widget.props.textColor),
                onChanged: (value) {
                  state.didChange(value);
                  widget.props.onChanged?.call(value);
                },
                obscureText: isObscure,
                inputFormatters: widget.props.inputFormatters,
                maxLength: widget.props.maxLength,
                keyboardType: widget.props.keyboardType,
                cursorColor: ColorRes.primary,
                buildCounter: (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) =>
                    null,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: widget.props.obscureText
                      ? _buildObscurementButton()
                      : widget.props.suffixIcon,
                  labelStyle: Styles.p1,
                  filled: true,
                  fillColor: widget.props.fillColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34),
                  ),
                  hintText: widget.props.hint,
                  hintStyle: Styles.p1.copyWith(
                    color: widget.props.hintColor,
                    height: 1,
                  ),
                ),
              ),
              if (state.hasError && !_hasFocus) ...[
                const SizedBox(height: 6),
                Text(
                  state.errorText!,
                  style: Styles.p1.copyWith(color: ColorRes.errorRed),
                  textAlign: TextAlign.center,
                ),
              ]
            ],
          );
        });
  }

  String? _validate(String? value) {
    if (value == null) {
      return null;
    }

    if (widget.props.validatorRules == null) {
      return null;
    }

    return validate(value, widget.props.validatorRules!);
  }

  void _submitField(String value) {
    widget.props.focusNode.unfocus();

    if (widget.props.nextFocusNode != null) {
      FocusScope.of(context).requestFocus(widget.props.nextFocusNode);
    }

    widget.props.onSubmitted?.call(value);
  }

  void _changeFieldFocus() {
    key.currentState!.validate();
  }

  void _toggleTextObscurement() {
    setState(() => isObscure = !isObscure);
  }

  Widget _buildObscurementButton() {
    return InkWell(
      onTap: _toggleTextObscurement,
      child: Icon(
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        size: 24,
        color: ColorRes.black64,
      ),
    );
  }
}
