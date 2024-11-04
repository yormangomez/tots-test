import 'package:flutter/foundation.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tots_ui/tots_ui.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.onComplete,
    this.onFieldSubmitted,
    this.isDisabled = false,
    this.isObscureText = false,
    this.autocorrect = true,
    this.validator,
    this.controller,
    this.autoFillHints,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.tapSuffixIcon,
    this.tapPrefixIcon,
    this.customErrorText,
    this.focusNode,
    this.scrollPadding,
    this.enableInteractiveSelection = true,
    this.showMaxLengthMessage = false,
    this.customErrorPaddingTop = AppSpacing.sm,
    this.helpText,
  });

  final String? label;
  final String? hintText;
  final String? customErrorText;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onComplete;
  final Function(String)? onFieldSubmitted;
  final bool isDisabled;
  final bool isObscureText;
  final Function(String)? validator;
  final TextEditingController? controller;
  final bool autocorrect;
  final Iterable<String>? autoFillHints;
  final List<TextInputFormatter>? inputFormatters;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final Function? tapSuffixIcon;
  final Function? tapPrefixIcon;
  final FocusNode? focusNode;
  final bool? enableInteractiveSelection;
  final bool showMaxLengthMessage;
  final EdgeInsets? scrollPadding;
  final double customErrorPaddingTop;
  final String? helpText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _textFocusNode;
  bool _hasError = false;
  String _text = '';
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _textFocusNode = widget.focusNode ?? FocusNode();
    _textFocusNode.addListener(_onFocusChange);
    _text = widget.controller?.text ?? '';
    _errorText = widget.customErrorText ?? '';
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
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
        widget.label != null
            ? Text(
                widget.label!,
                style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
                  color: widget.isDisabled
                      ? AppColors.white
                      : _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primaryYello
                              : _text.isNotEmpty
                                  ? AppColors.white
                                  : AppColors.white,
                ),
              )
            : const SizedBox(),
        widget.label != null
            ? const SizedBox(
                height: AppSpacing.xs,
              )
            : const SizedBox(),
        widget.maxLines != null
            ? TextFormField(
                scrollPadding: widget.scrollPadding != null
                    ? widget.scrollPadding!
                    : const EdgeInsets.all(20.0),
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
                          _errorText = widget.customErrorText ?? '';
                        }
                        setState(() {});

                        return null;
                      }
                    : null,
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                autocorrect: widget.autocorrect,
                enabled: !widget.isDisabled,
                autofillHints: widget.autoFillHints,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                onTap: () {
                  setState(() {
                    _textFocusNode.requestFocus();
                  });
                  if (widget.onTap != null) widget.onTap!();
                },
                onTapOutside: (_) {
                  setState(() {
                    _textFocusNode.unfocus();
                  });
                  if (widget.onComplete != null) widget.onComplete!(_text);
                },
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                  setState(() {
                    _text = value;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    _textFocusNode.unfocus();
                  });
                  if (widget.onComplete != null) widget.onComplete!(_text);
                },
                cursorColor:
                    _hasError ? AppColors.error : AppColors.primaryYello,
                decoration: InputDecoration(
                  counter: const SizedBox.shrink(),
                  filled: true,
                  fillColor:
                      widget.isDisabled ? AppColors.black1 : AppColors.white,
                  hintText: _hasError ? '' : widget.hintText,
                  hintStyle: UITextStyle.paragraphs.paragraph1Regular.copyWith(
                    color: AppColors.black,
                  ),
                  hoverColor: AppColors.black2,
                  contentPadding: kIsWeb
                      ? const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        )
                      : const EdgeInsets.all(16),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.black4,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primaryYello
                              : _text.isNotEmpty
                                  ? AppColors.black
                                  : AppColors.black4,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryYello,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  prefixIcon: widget.prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10, left: 16),
                          child: Icon(
                            widget.prefixIcon,
                            size: 30.0,
                            color: _hasError
                                ? AppColors.error
                                : _textFocusNode.hasPrimaryFocus
                                    ? AppColors.primaryYello
                                    : _text.isNotEmpty
                                        ? AppColors.black
                                        : AppColors.black4,
                          ))
                      : null,
                  suffixIcon: widget.suffixIcon != null
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.tapSuffixIcon != null) {
                                widget.tapSuffixIcon!();
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 16),
                              child: Icon(
                                widget.suffixIcon,
                                size: 30.0,
                                color: _hasError
                                    ? AppColors.error
                                    : _textFocusNode.hasPrimaryFocus
                                        ? AppColors.primaryYello
                                        : _text.isNotEmpty
                                            ? AppColors.black
                                            : AppColors.black4,
                              ),
                            ),
                          ),
                        )
                      : null,
                  suffixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                  prefixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                ),
              )
            : TextFormField(
                onFieldSubmitted: (value) {
                  if (widget.onFieldSubmitted != null)
                    widget.onFieldSubmitted!(value);
                  setState(() {
                    _text = value;
                  });
                },
                enableInteractiveSelection: widget.enableInteractiveSelection,
                focusNode: _textFocusNode,
                scrollPadding: widget.scrollPadding != null
                    ? widget.scrollPadding!
                    : const EdgeInsets.all(20.0),
                controller: widget.controller,
                validator: widget.validator != null
                    ? (e) {
                        final validation = widget.validator!(e ?? '');

                        if (validation != null) {
                          _hasError = true;
                          _errorText = validation;
                        } else {
                          _hasError = false;
                          _errorText = widget.customErrorText ?? '';
                        }
                        setState(() {});

                        return null;
                      }
                    : null,
                maxLength: widget.maxLength,
                obscureText: widget.isObscureText,
                autocorrect: widget.autocorrect,
                enabled: !widget.isDisabled,
                autofillHints: widget.autoFillHints,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                onTap: () {
                  setState(() {
                    _textFocusNode.requestFocus();
                  });
                  if (widget.onTap != null) widget.onTap!();
                },
                onTapOutside: (_) {
                  setState(() {
                    _textFocusNode.unfocus();
                  });
                  if (widget.onComplete != null) widget.onComplete!(_text);
                },
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                  setState(() {
                    _text = value;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    _textFocusNode.unfocus();
                  });
                  if (widget.onComplete != null) widget.onComplete!(_text);
                },
                cursorColor:
                    _hasError ? AppColors.error : AppColors.primaryYello,
                decoration: InputDecoration(
                  counter: const SizedBox.shrink(),
                  filled: true,
                  fillColor:
                      widget.isDisabled ? AppColors.black1 : AppColors.white,
                  hintText: _hasError ? '' : widget.hintText,
                  hintStyle: UITextStyle.paragraphs.paragraph1Regular.copyWith(
                    color: AppColors.black4,
                  ),
                  isDense: true,
                  hoverColor: AppColors.black2,
                  contentPadding: kIsWeb
                      ? const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        )
                      : const EdgeInsets.all(16),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.black4,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primaryYello
                              : _text.isNotEmpty
                                  ? AppColors.black
                                  : AppColors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primaryYello
                              : _text.isNotEmpty
                                  ? AppColors.black
                                  : AppColors.black,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  prefixIcon: widget.prefixIcon != null
                      ? GestureDetector(
                          onTap: () {
                            if (widget.tapPrefixIcon != null) {
                              widget.tapPrefixIcon!();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 16),
                            child: Icon(
                              widget.prefixIcon,
                              size: 30.0,
                              color: _hasError
                                  ? AppColors.error
                                  : _textFocusNode.hasPrimaryFocus
                                      ? AppColors.primaryYello
                                      : _text.isNotEmpty
                                          ? AppColors.black
                                          : AppColors.black,
                            ),
                          ),
                        )
                      : null,
                  suffixIcon: widget.suffixIcon != null
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.tapSuffixIcon != null) {
                                widget.tapSuffixIcon!();
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 16),
                              child: Icon(
                                widget.suffixIcon,
                                size: 30.0,
                                color: _hasError
                                    ? AppColors.error
                                    : _textFocusNode.hasPrimaryFocus
                                        ? AppColors.primaryYello
                                        : _text.isNotEmpty
                                            ? AppColors.black
                                            : AppColors.black,
                              ),
                            ),
                          ),
                        )
                      : null,
                  suffixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                  prefixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                ),
              ),
        _errorText.isNotEmpty
            ? SizedBox(
                height: widget.customErrorPaddingTop,
              )
            : const SizedBox(),
        if (widget.helpText != null)
          Text(
            widget.helpText!,
            style: UITextStyle.captions.captionMedium.copyWith(
              color: AppColors.black,
            ),
          ),
        widget.showMaxLengthMessage && widget.maxLength != null
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Caracteres: ${widget.controller!.text.length}/${widget.maxLength}',
                  style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
                    color: widget.isDisabled
                        ? AppColors.black4
                        : _hasError
                            ? AppColors.error
                            : _textFocusNode.hasPrimaryFocus
                                ? AppColors.primaryYello
                                : _text.isNotEmpty
                                    ? AppColors.black
                                    : AppColors.black4,
                  ),
                ),
              )
            : const SizedBox(),
        _errorText.isNotEmpty
            ? Row(
                children: [
                  _hasError
                      ? Icon(
                          PhosphorIcons.warningCircle(),
                          size: 16.0,
                          color: AppColors.error,
                        )
                      : const SizedBox(),
                  SizedBox(width: _hasError ? 8 : 0),
                  Text(
                    _errorText,
                    style: UITextStyle.captions.captionMedium.copyWith(
                      color: _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primaryYello
                              : _text.isNotEmpty
                                  ? AppColors.black
                                  : AppColors.black4,
                      height: 1,
                    ),
                  ),
                ],
              )
            : const SizedBox(height: 24),
      ],
    );
  }
}
