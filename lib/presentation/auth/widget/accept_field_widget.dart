import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/presentation/auth/widget/privasy_policy.dart';
import 'package:register_app/presentation/auth/widget/tarms_service.dart';

class AcceptFieldWidget extends StatelessWidget {
  const AcceptFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFF3461FD);
                }
                return Color(0xFFF5F9FD);
              },
            ),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            visualDensity: VisualDensity.compact,
            value: false,
            onChanged: (value) {},
          ),
        ),
        SizedBox(width: 14.w),
        Row(
          children: [
            Text(
              'I’m agree to',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 12.sp, color: Colors.grey),
            ),
            GestureDetector(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TermsOfService())),
              child: Text(
                ' Tarms of Service',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xFF3461FD),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Text(
              ' and',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 12.sp, color: Colors.grey),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PrivacyPolicyScreen())) ,
              child: Text(
                ' Privasy Policy',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  color: Color(0xFF3461FD),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
