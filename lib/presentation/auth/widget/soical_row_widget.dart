import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/data/controller/soical_row_cubit/cubit/soical_row_cubit.dart';

class SoicalRegisterationWidget extends StatelessWidget {
  const SoicalRegisterationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SoicalRowCubit(),
      child: SizedBox(
        width: 345.w,
        height: 56.h,
        child: Row(
          children: [
            Expanded(
              child: BlocListener<SoicalRowCubit, SoicalRowState>(
                listener: (context, state) {
                  if (state is SoicalRowLoadingFacbook) {
                    showDialog(
                      context: context,
                      builder: (_) =>
                          Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is SoicalRowSuccessFacbook) {
                  } else if (state is SoicalRowFailureFacbook) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(backgroundColor: Colors.red,
                          content: Text('Google Sign In Failed')));
                  }
                },
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    fixedSize: Size(160.w, 56.h),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    backgroundColor: Color(0xFFF5F9FD),
                  ),
                  onPressed: () {},
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/_Facebook.png'),
                      SizedBox(width: 16.5.w),
                      Text(
                        'Facebook',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: BlocListener<SoicalRowCubit, SoicalRowState>(
                listener: (context, state) {
                  if (state is SoicalRowLoadingGoogle) {
                    showDialog(
                      context: context,
                      builder: (_) =>
                          Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is SoicalRowSuccessGoogle) {
                  } else if (state is SoicalRowFailureGoogle) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        backgroundColor: Colors.red,
                          content: Text('Google Sign In Failed')));
                  }

                  // TODO: implement listener
                },
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(160.w, 56.h),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      backgroundColor: Color(0xFFF5F9FD),
                    ),
                    onPressed: () {},
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/_Google.png'),
                        SizedBox(width: 16.5.w),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
