import 'package:flutter/material.dart';

class selectDate_widget extends StatelessWidget {
  selectDate_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        width: 327,
        height: 72,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Color(0xffFFBC99)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.date_range_outlined,
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
                    'DATE',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        color: Color(0xff6F767E)),
                  ),
                  Text(
                    'Select your Date',
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
