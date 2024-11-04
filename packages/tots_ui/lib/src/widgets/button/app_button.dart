import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

/// {@template app_button}
/// Button with text displayed in the application.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  final TypeButton typeButton;

  /// {@macro app_button}
  const AppButton._({
    this.onPressed,
    this.onTap,
    this.iconRoute,
    this.iconRoute2,
    bool? valueButton,
    required this.typeButton,
    required this.title,
    Color? buttonColor,
    Color? containerColor,
    Color? borderColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    BorderSide? borderSide,
    double? elevation,
    TextStyle? textStyle,
    Size? maximumSize,
    Size? minimumSize,
    EdgeInsets? padding,
    Color? colorTitle,
    double? radius,
    Gradient? gradient,
    this.width,
    this.height,
    Icon? icon,
    Icon? icon2,
    Color? iconColor,
    double? borderWidth,
    super.key,
  })  : _buttonColor = buttonColor ?? Colors.white,
        _containerColor = containerColor ?? Colors.white,
        _disabledButtonColor = disabledButtonColor ?? AppColors.black4,
        _borderSide = borderSide,
        _foregroundColor = foregroundColor ?? AppColors.black,
        _disabledForegroundColor = disabledForegroundColor ?? AppColors.white,
        _elevation = elevation ?? 0,
        _textStyle = textStyle,
        _maximumSize = maximumSize ?? _defaultMaximumSize,
        _minimumSize = minimumSize ?? _defaultMinimumSize,
        _colorTitle = colorTitle ?? AppColors.white,
        _radius = radius ?? 8,
        _padding = padding ?? _defaultPadding,
        _gradient = gradient ?? _defaultGradient,
        _icon = icon,
        _borderColor = borderColor ?? AppColors.primaryYello,
        _icon2 = icon2,
        _iconColor = iconColor ?? AppColors.white,
        _borderWidth = borderWidth ?? 1;

  /// Filled black button.
  const AppButton.primary({
    Key? key,
    bool? valueButton,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    String? iconRoute,
    String? iconRoute2,
    String? title,
    EdgeInsets? padding,
    double? radius,
    double? width,
    double? height,
    Color? buttonColor,
    Color? colorTitle,
    Icon? icon,
    Icon? icon2,
    Color? iconColor,
  }) : this._(
          key: key,
          typeButton: TypeButton.normal,
          valueButton: valueButton,
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.primaryYello,
          foregroundColor: AppColors.white,
          elevation: elevation,
          textStyle: textStyle,
          iconRoute: iconRoute,
          iconRoute2: iconRoute2,
          title: title,
          colorTitle: colorTitle ?? AppColors.black,
          padding: padding,
          radius: radius,
          width: width,
          height: height,
          icon: icon,
          icon2: icon2,
          iconColor: iconColor,
        );

  /// Filled secondary button.
  const AppButton.secondary({
    Key? key,
    bool? valueButton,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    Color? disabledButtonColor,
    Color? colorTitle,
    String? iconRoute,
    String? iconRoute2,
    EdgeInsets? padding,
    String? title,
    double? radius,
    double? width,
    double? height,
    Icon? icon,
    Icon? icon2,
    Color? iconColor,
  }) : this._(
          key: key,
          typeButton: TypeButton.normal,
          valueButton: valueButton,
          onPressed: onPressed,
          buttonColor: AppColors.transparent,
          foregroundColor: AppColors.primaryYello,
          disabledButtonColor: disabledButtonColor ?? AppColors.transparent,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding ?? _smallPadding,
          iconRoute: iconRoute,
          iconRoute2: iconRoute2,
          title: title,
          colorTitle: colorTitle ?? AppColors.primaryYello,
          radius: radius,
          width: width,
          height: height,
          icon: icon,
          iconColor: iconColor,
          icon2: icon2,
        );

  /// Filled secondary button.
  const AppButton.circular({
    Key? key,
    bool? valueButton,
    void Function()? onTap,
    double? elevation,
    TextStyle? textStyle,
    Color? containerColor,
    Color? disabledButtonColor,
    String? iconRoute,
    String? iconRoute2,
    Icon? icon,
    Icon? icon2,
    EdgeInsets? padding,
    double? width,
    double? height,
    double? radius,
    Color? borderColor,
    Color? colorTitle,
    String? title,
    Color? iconColor,
  }) : this._(
          key: key,
          typeButton: TypeButton.circular,
          valueButton: valueButton,
          onTap: onTap,
          borderColor: borderColor,
          buttonColor: AppColors.black1,
          foregroundColor: AppColors.primaryYello,
          containerColor: containerColor ?? AppColors.transparent,
          disabledButtonColor: disabledButtonColor ?? AppColors.transparent,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding ?? _smallPadding,
          iconRoute: iconRoute,
          iconRoute2: iconRoute2,
          title: title,
          colorTitle: AppColors.primaryYello,
          width: width,
          height: height,
          radius: radius,
          icon: icon,
          icon2: icon2,
          iconColor: iconColor,
        );

  /// Filled gradient button
  const AppButton.gradient({
    Key? key,
    bool? valueButton,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    Color? disabledButtonColor,
    Color? colorTitle,
    String? iconRoute,
    String? iconRoute2,
    EdgeInsets? padding,
    String? title,
    double? radius,
    Gradient? gradient,
    double? width,
    double? height,
    Icon? icon,
    Icon? icon2,
    Color? iconColor,
  }) : this._(
          key: key,
          typeButton: TypeButton.gradient,
          valueButton: valueButton,
          onPressed: onPressed,
          buttonColor: AppColors.transparent,
          foregroundColor: AppColors.primaryYello,
          disabledButtonColor: disabledButtonColor ?? AppColors.transparent,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding ?? _smallPadding,
          iconRoute: iconRoute,
          iconRoute2: iconRoute2,
          title: title,
          colorTitle: AppColors.primaryYello,
          radius: radius,
          gradient: gradient,
          width: width,
          height: height,
          icon: icon,
          icon2: icon2,
          iconColor: iconColor,
        );

  const AppButton.contour({
    Key? key,
    bool? valueButton,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    Color? containerColor,
    Color? disabledButtonColor,
    String? iconRoute,
    String? iconRoute2,
    EdgeInsets? padding,
    double? radius,
    double? width,
    double? height,
    Color? borderColor,
    Color? colorTitle,
    String? title,
    Icon? icon,
    Icon? icon2,
    Color? iconColor,
  }) : this._(
          key: key,
          typeButton: TypeButton.contour,
          onPressed: onPressed,
          borderColor: borderColor,
          buttonColor: AppColors.transparent,
          foregroundColor: AppColors.primaryYello,
          disabledButtonColor: disabledButtonColor ?? AppColors.black1,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding ?? _smallPadding,
          iconRoute: iconRoute,
          iconRoute2: iconRoute2,
          colorTitle: colorTitle,
          title: title,
          radius: radius,
          width: width,
          height: height,
          icon: icon,
          icon2: icon2,
          iconColor: iconColor,
        );

  const AppButton.line({
    Key? key,
    bool? valueButton,
    void Function()? onTap,
    double? elevation,
    TextStyle? textStyle,
    Color? containerColor,
    Color? disabledButtonColor,
    String? iconRoute,
    String? iconRoute2,
    Icon? icon,
    Icon? icon2,
    EdgeInsets? padding,
    double? width,
    double? height,
    double? radius,
    Color? borderColor,
    Color? colorTitle,
    String? title,
    Color? iconColor,
    double? borderWidth,
  }) : this._(
            key: key,
            typeButton: TypeButton.line,
            valueButton: valueButton,
            onTap: onTap,
            borderColor: borderColor,
            buttonColor: AppColors.black1,
            foregroundColor: AppColors.primaryYello,
            containerColor: containerColor ?? AppColors.transparent,
            disabledButtonColor: disabledButtonColor ?? AppColors.transparent,
            elevation: elevation,
            textStyle: textStyle,
            padding: padding ?? _smallPadding,
            iconRoute: iconRoute,
            iconRoute2: iconRoute2,
            title: title,
            colorTitle: colorTitle ?? AppColors.primaryYello,
            width: width,
            height: height,
            radius: radius,
            icon: icon,
            icon2: icon2,
            iconColor: iconColor,
            borderWidth: borderWidth);

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 56);

  /// The minimum size of the button.
  static const _defaultMinimumSize = Size(double.infinity, 56);

  /// The padding of the small variant of the button.
  static const _smallPadding = EdgeInsets.symmetric(horizontal: AppSpacing.lg);

  /// The padding of the the button.
  static const _defaultPadding = EdgeInsets.symmetric(vertical: AppSpacing.md);

  /// Default gradient for buttons
  static const _defaultGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: <Color>[Colors.deepOrange, Colors.orange],
  );

  /// [VoidCallback] called when button is pressed.
  /// Button is disabled when null.
  final VoidCallback? onPressed;
  final void Function()? onTap;

  /// A background color of the button.
  ///
  /// Defaults to [Colors.white].
  final Color _buttonColor;
  final Color _containerColor;

  /// A disabled background color of the button.
  ///
  /// Defaults to [AppColors.disabledButton].
  final Color? _disabledButtonColor;

  /// Color of the text, icons etc.
  ///
  /// Defaults to [AppColors.black].
  final Color _foregroundColor;

  /// Color of the disabled text, icons etc.
  ///
  /// Defaults to [AppColors.disabledForeground].
  final Color _disabledForegroundColor;

  /// A border of the button.
  final BorderSide? _borderSide;

  /// Elevation of the button.
  final double _elevation;

  /// [TextStyle] of the button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? _textStyle;

  /// The maximum size of the button.
  ///
  /// Defaults to [_defaultMaximumSize].
  final Size _maximumSize;

  /// The minimum size of the button.
  ///
  /// Defaults to [_defaultMinimumSize].
  final Size _minimumSize;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets _padding;

  /// [Widget] displayed on the button.
  final String? iconRoute;
  final String? iconRoute2;
  final Icon? _icon;
  final Icon? _icon2;
  final String? title;
  final Color _colorTitle;
  final double _radius;
  final Color _borderColor;
  final Color? _iconColor;
  final double? _borderWidth;

  /// Gradient
  final Gradient? _gradient;

  /// Width and Height of the button
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textStyle = _textStyle ??
        UITextStyle.labels.label.copyWith(
          color: _colorTitle,
          fontSize: 16,
        );

    switch (typeButton) {
      case TypeButton.normal:
        return SizedBox(
          width: width ?? _maximumSize.width,
          height: height ?? _maximumSize.height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              maximumSize: WidgetStateProperty.all(_maximumSize),
              padding: WidgetStateProperty.all(_padding),
              minimumSize: WidgetStateProperty.all(_minimumSize),
              textStyle: WidgetStateProperty.all(textStyle),
              backgroundColor: onPressed == null
                  ? WidgetStateProperty.all(_disabledButtonColor)
                  : WidgetStateProperty.all(_buttonColor),
              elevation: WidgetStateProperty.all(_elevation),
              foregroundColor: onPressed == null
                  ? WidgetStateProperty.all(_disabledForegroundColor)
                  : WidgetStateProperty.all(_foregroundColor),
              side: WidgetStateProperty.all(_borderSide),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_radius),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconRoute != null)
                  Image.network(
                    iconRoute!,
                    width: MediaQuery.sizeOf(context).width < 900
                        ? 18
                        : 600 * 0.06,
                    height: MediaQuery.sizeOf(context).width < 900
                        ? 18
                        : 750 * 0.06,
                    color: _iconColor,
                  )
                else if (_icon != null)
                  _icon,
                if (title != null) ...[
                  SizedBox(
                      width: iconRoute != null || _icon != null
                          ? AppSpacing.sm
                          : 0),
                  Text(
                    title!,
                    style: textStyle,
                  )
                ],
                if (iconRoute2 != null) ...[
                  const Spacer(),
                  Image.asset(
                    iconRoute2!,
                  )
                ] else if (_icon2 != null) ...[
                  const Spacer(),
                  _icon2,
                ]
              ],
            ),
          ),
        );
      case TypeButton.circular:
        return SizedBox(
          width: width ?? _maximumSize.width,
          height: height ?? _maximumSize.height,
          child: InkWell(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(_radius),
                  border: Border.all(
                    color: _borderColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (iconRoute != null)
                        Image.asset(
                          iconRoute!,
                        )
                      else if (_icon != null)
                        _icon,
                      if (title != null) ...[
                        SizedBox(
                            width: iconRoute != null || _icon != null
                                ? AppSpacing.sm
                                : 0),
                        Text(
                          title!,
                          style: textStyle,
                        )
                      ],
                      if (iconRoute2 != null) ...[
                        const Spacer(),
                        Image.asset(
                          iconRoute2!,
                        )
                      ] else if (_icon2 != null) ...[
                        const Spacer(),
                        _icon2,
                      ]
                    ],
                  ),
                )),
          ),
        );
      case TypeButton.gradient:
        return Container(
          width: width ?? _maximumSize.width,
          height: height ?? _maximumSize.height,
          decoration: BoxDecoration(
            gradient: onPressed != null ? _gradient : null,
            color: onPressed == null ? _disabledButtonColor : null,
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: _padding,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_radius)),
              elevation: _elevation,
              foregroundColor:
                  onPressed == null ? _disabledButtonColor : _foregroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconRoute != null)
                  Image.asset(
                    iconRoute!,
                  )
                else if (_icon != null)
                  _icon,
                if (title != null) ...[
                  SizedBox(
                      width: iconRoute != null || _icon != null
                          ? AppSpacing.sm
                          : 0),
                  Text(
                    title!,
                    style: textStyle,
                  )
                ],
                if (iconRoute2 != null) ...[
                  const Spacer(),
                  Image.asset(
                    iconRoute2!,
                  )
                ] else if (_icon2 != null) ...[
                  const Spacer(),
                  _icon2,
                ]
              ],
            ),
          ),
        );
      case TypeButton.contour:
        return Container(
          width: width ?? _maximumSize.width,
          height: height ?? _maximumSize.height,
          decoration: BoxDecoration(
            color: _buttonColor,
            borderRadius: BorderRadius.circular(_radius),
            border: Border.all(
              color: _borderColor,
            ),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: _padding,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_radius)),
              elevation: _elevation,
              foregroundColor:
                  onPressed == null ? _disabledButtonColor : _foregroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconRoute != null)
                  Image.asset(
                    iconRoute!,
                  )
                else if (_icon != null)
                  _icon,
                if (title != null) ...[
                  SizedBox(
                      width: iconRoute != null || _icon != null
                          ? AppSpacing.sm
                          : 0),
                  Text(
                    title!,
                    style: textStyle,
                  )
                ],
                if (iconRoute2 != null) ...[
                  const Spacer(),
                  Image.asset(
                    iconRoute2!,
                  )
                ] else if (_icon2 != null) ...[
                  const Spacer(),
                  _icon2,
                ]
              ],
            ),
          ),
        );
      case TypeButton.line:
        return SizedBox(
          width: width ?? _maximumSize.width,
          height: height ?? _maximumSize.height,
          child: InkWell(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(_radius),
                  border: Border(
                    bottom:
                        BorderSide(width: _borderWidth!, color: _borderColor),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (iconRoute != null)
                        Image.asset(
                          iconRoute!,
                        )
                      else if (_icon != null)
                        _icon,
                      if (title != null) ...[
                        SizedBox(
                            width: iconRoute != null || _icon != null
                                ? AppSpacing.sm
                                : 0),
                        Text(
                          title!,
                          style: textStyle,
                        )
                      ],
                      if (iconRoute2 != null) ...[
                        const Spacer(),
                        Image.asset(
                          iconRoute2!,
                        )
                      ] else if (_icon2 != null) ...[
                        const Spacer(),
                        _icon2,
                      ]
                    ],
                  ),
                )),
          ),
        );
    }
  }
}

enum TypeButton { normal, circular, gradient, contour, line }
