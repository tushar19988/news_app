import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Save Post",
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
