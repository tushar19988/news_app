import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchWithName extends StatelessWidget {
  const SwitchWithName({
    super.key,
    required this.title,
    required this.switchValue,
    required this.onChanged,
  });

  final String title;
  final bool switchValue;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch(
          activeTrackColor: Colors.orange,
          value: switchValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
