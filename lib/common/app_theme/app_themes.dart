import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/common/app_theme/app_theme.dart';

class AppThemes {
  static Color? _getElevatedButtonBackgroundColor(Set<MaterialState> state) {
    if (state.contains(MaterialState.disabled)) {
      return AppColors.grey[200]!;
    }
    return AppColors.primary;
  }

  static Color? _getElevatedButtonForegroundColor(Set<MaterialState> state) {
    if (state.contains(MaterialState.disabled)) {
      return AppColors.grey[500]!;
    }
    return AppColors.white;
  }

  static Color? _getButtonForegroundColor(Set<MaterialState> state) {
    if (state.contains(MaterialState.disabled)) {
      return AppColors.grey[500]!;
    }
    return AppColors.brand;
  }

  static ButtonStyle outlineButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.grey[500]!;
      }
      if (states.contains(MaterialState.pressed)) {
        return AppColors.brand;
      }
      return AppColors.primary;
    }),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.grey[200]!;
      }
      return AppColors.transparent;
    }),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.transparent;
      }
      return AppColors.primary.withOpacity(0.1);
    }),
    shape: MaterialStateProperty.resolveWith((states) {
      final color = states.contains(MaterialState.disabled)
          ? AppColors.grey[200]!
          : AppColors.primary;
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.sp),
        side: BorderSide(
          width: 1.sp,
          color: color,
        ),
      );
    }),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        vertical: 10.5.h,
        horizontal: 32.w,
      ),
    ),
    textStyle: MaterialStateProperty.all(AppTypo.heading5),
  );

  static ButtonStyle elevatedButtonStyle = ButtonStyle(
    foregroundColor:
        MaterialStateProperty.resolveWith(_getElevatedButtonForegroundColor),
    backgroundColor:
        MaterialStateProperty.resolveWith(_getElevatedButtonBackgroundColor),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.transparent;
      }
      return AppColors.primary.withOpacity(0.1);
    }),
    textStyle: MaterialStateProperty.all(AppTypo.heading5),
    shape: MaterialStateProperty.resolveWith((states) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.sp),
        side: BorderSide(
          width: 1.sp,
          color: states.contains(MaterialState.disabled)
              ? AppColors.grey[200]!
              : AppColors.primary,
        ),
      );
    }),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        vertical: 10.5.h,
        horizontal: 32.w,
      ),
    ),
  );

  static ButtonStyle textButtonStyle = ButtonStyle(
    foregroundColor:
        MaterialStateProperty.resolveWith(_getButtonForegroundColor),
    backgroundColor: MaterialStateProperty.all(AppColors.transparent),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.transparent;
      }
      return AppColors.primary.withOpacity(0.1);
    }),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.sp),
        side: BorderSide.none,
      ),
    ),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        vertical: 10.5.h,
        horizontal: 32.w,
      ),
    ),
    textStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled) ||
          states.contains(MaterialState.pressed)) {
        return AppTypo.heading5;
      }
      return AppTypo.heading5.copyWith(decoration: TextDecoration.underline);
    }),
  );

  static ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: "DM Sans",
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.primary.withOpacity(0.1),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.grey[700]!,
        size: 24.sp,
      ),
    ),
    buttonTheme: ButtonThemeData(
      splashColor: AppColors.primary.withOpacity(0.1),
      buttonColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.sp),
        side: BorderSide(
          width: 1.sp,
          color: AppColors.primary,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: textButtonStyle,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlineButtonStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: elevatedButtonStyle,
    ),
    indicatorColor: AppColors.primary,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: AppColors.grey[700]!,
          width: 1.sp,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: AppColors.grey[400]!,
          width: 1.sp,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: AppColors.grey[400]!,
          width: 1.sp,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: AppColors.red[600]!,
          width: 1.sp,
        ),
      ),
      errorStyle: AppTypo.bodyTiny.copyWith(
        color: AppColors.red[400]!,
      ),
      hintStyle: AppTypo.paragraph.copyWith(
        color: AppColors.grey[500]!,
      ),
      helperStyle: AppTypo.bodyTiny.copyWith(
        color: AppColors.grey[500]!,
      ),
      labelStyle: AppTypo.heading7.copyWith(
        color: AppColors.grey[700]!,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 6.h,
        horizontal: 12.w,
      ),
      suffixIconColor: AppColors.grey[500],
      suffixStyle: AppTypo.heading7.copyWith(
        color: AppColors.grey[500]!,
      ),
    ),
  );
}
