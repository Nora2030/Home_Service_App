import 'package:flutter/material.dart';
//import 'package:homeservice/widgets/selectD&T_widget.dart';

class selectTime_widget extends StatelessWidget {
 const selectTime_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 327,
      height: 72,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: const Color(0xffB5E4CA)),
      child:const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.timelapse,
              size: 24,
              color: Color(0xff434355),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TIME',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Inter',
                      color: Color(0xff6F767E)),
                ),
                Text(
                  'Select your Time',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
