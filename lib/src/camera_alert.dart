import 'dart:io';

import 'package:custom_cam/src/custom_icons_icons.dart';
import 'package:custom_cam/src/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraAlert extends StatelessWidget {
  final String title;
  final String description;
  final String positiveInput;
  final String negativeInput;
  final VoidCallback positiveCallback;
  final Orientation orientation;

  const CameraAlert({
    Key? key,
    required this.title,
    required this.description,
    required this.positiveInput,
    required this.negativeInput,
    required this.positiveCallback,
    required this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(CustomIcons.warning,
                size: Platform.isIOS && orientation == Orientation.landscape
                    ? 20.w
                    : 55.w,
                color: CustomTheme.secondaryColor),
            Padding(
              padding: EdgeInsets.only(top: 18.h),
              child: SizedBox(
                  width: Platform.isIOS && orientation == Orientation.landscape
                      ? null
                      : 250.w,
                  child: Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: Platform.isIOS &&
                                  orientation == Orientation.landscape
                              ? 10.sp
                              : 18.sp,
                          fontWeight: FontWeight.w700))),
            )
          ],
        ),
      ),
      content: SizedBox(
          width: Platform.isIOS && orientation == Orientation.landscape
              ? null
              : 250.w,
          child: Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xFF2C2C2C),
                  fontSize:
                      Platform.isIOS && orientation == Orientation.landscape
                          ? 7.sp
                          : 14.sp,
                  fontWeight: FontWeight.w400))),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.w,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      positiveCallback();
                    },
                    style: CustomTheme.textButtonStyle,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        positiveInput,
                        style: TextStyle(
                          fontSize: Platform.isIOS &&
                                  orientation == Orientation.landscape
                              ? 8.sp
                              : 16.sp,
                        ),
                      ),
                    )),
              ),
              if (negativeInput.isNotEmpty)
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: CustomTheme.primaryColor),
                  child: Text(
                    negativeInput,
                    style: TextStyle(
                      fontSize:
                          Platform.isIOS && orientation == Orientation.landscape
                              ? 8.sp
                              : 16.sp,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
    );
  }
}
