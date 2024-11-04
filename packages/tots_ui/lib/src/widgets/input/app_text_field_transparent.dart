import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tots_ui/tots_ui.dart';

class AppTextFieldTransparent extends StatefulWidget {
  const AppTextFieldTransparent({
    super.key,
    this.label,
    this.hintText,
    this.maxLines,
    this.onChanged,
    this.isDisabled = false,
    this.isObscureText = false,
    this.autocorrect = true,
    this.validator,
    this.controller,
    this.autoFillHints,
    this.inputFormatters,
    this.prefixRoute,
    this.suffixIconData,
    this.keyboardType,
    this.tapSuffixIcon,
    this.tapPrefixIcon,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.black4,
    this.inputTextStyle,
  });

  final String? label;
  final String? hintText;
  final int? maxLines;
  final Function(String)? onChanged;
  final bool isDisabled;
  final bool isObscureText;
  final Function(String)? validator;
  final TextEditingController? controller;
  final bool autocorrect;
  final Iterable<String>? autoFillHints;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixRoute;
  final IconData? suffixIconData;
  final TextInputType? keyboardType;
  final Function? tapSuffixIcon;
  final Function? tapPrefixIcon;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle? inputTextStyle;

  @override
  State<AppTextFieldTransparent> createState() =>
      _AppTextFieldTransparentState();
}

class _AppTextFieldTransparentState extends State<AppTextFieldTransparent> {
  final FocusNode _textFocusNode = FocusNode();
  bool _hasError = false;
  String _text = '';
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _textFocusNode.addListener(_onFocusChange);
    _text = widget.controller?.text ?? '';
  }

  @override
  void didUpdateWidget(covariant AppTextFieldTransparent oldWidget) {
    super.didUpdateWidget(oldWidget);
    _text = widget.controller?.text ?? '';
  }

  @override
  void dispose() {
    _textFocusNode.removeListener(_onFocusChange);
    _textFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              color: _hasError
                  ? Colors.red
                  : _textFocusNode.hasPrimaryFocus
                      ? Colors.blue
                      : _text.isNotEmpty
                          ? Colors.black
                          : Colors.grey,
            ),
          ),
        if (widget.label != null) const SizedBox(height: 8),
        TextFormField(
          focusNode: _textFocusNode,
          controller: widget.controller,
          validator: widget.validator != null
              ? (e) {
                  final validation = widget.validator!(e ?? '');
                  if (validation != null) {
                    _hasError = true;
                    _errorText = validation;
                  } else {
                    _hasError = false;
                    _errorText = '';
                  }
                  setState(() {});
                  return validation;
                }
              : null,
          maxLines: widget.maxLines,
          autocorrect: widget.autocorrect,
          enabled: !widget.isDisabled,
          autofillHints: widget.autoFillHints,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          onTap: () {
            setState(() {
              _textFocusNode.requestFocus();
            });
          },
          onTapOutside: (_) {
            setState(() {
              _textFocusNode.unfocus();
            });
          },
          onChanged: (value) {
            if (widget.onChanged != null) widget.onChanged!(value);
            setState(() {
              _text = value;
            });
          },
          cursorColor: _hasError ? Colors.red : Colors.blue,
          style: widget.inputTextStyle ?? const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.backgroundColor,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.black4, fontSize: 15),
            contentPadding: const EdgeInsets.all(16),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        if (_errorText.isNotEmpty) const SizedBox(height: 8),
        if (_errorText.isNotEmpty)
          Row(
            children: [
              if (_hasError) const Icon(Icons.error, color: Colors.red),
              if (_hasError) const SizedBox(width: 8),
              Text(
                _errorText,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
      ],
    );
  }
}
