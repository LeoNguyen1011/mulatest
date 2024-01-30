import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppShading {
  static BoxShadow small = BoxShadow(
    color: Colors.black.withOpacity(0.08),
    offset: Offset(0, 4.h),
    blurRadius: 8.sp,
    spreadRadius: 0,
  );

  static BoxShadow medium = BoxShadow(
    color: const Color(0xFF1D1D1B).withOpacity(0.1),
    offset: Offset(0, 8.h),
    blurRadius: 30.sp,
    spreadRadius: 0,
  );

  static BoxShadow large = BoxShadow(
    color: const Color(0xFF1D1D1B).withOpacity(0.15),
    offset: Offset(0, 20.h),
    blurRadius: 45.sp,
    spreadRadius: 0,
  );

  static BoxShadow extraLarge = BoxShadow(
      color: const Color(0xFF111110).withOpacity(0.2),
      offset: const Offset(0, 20),
      blurRadius: 40.sp,
      spreadRadius: 0);
}
