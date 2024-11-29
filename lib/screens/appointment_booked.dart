
import 'package:final_project/screens/bockings_screen.dart';
import 'package:final_project/widgets/selectD&T_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: Lottie.asset(
                'assets/lottie_assets/success.json',
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Successfully Booked',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            //back to home page
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            // child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                 width: 343,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return
                          BockingsScreen(dateTime: DateTime(date.year, date.month, date.day,
                                 time.hour, time.minute));
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    surfaceTintColor: const Color(0xff6759FF),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  child: const Text(
                    'Back To Booking Page',
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            )
            // child: ElevatedButton(
            //   // width: double.infinity,
            // title: 'Back to Home Page',
            // onPressed: () => Navigator.of(context).pushNamed('main'),
            // disable: false,
            //  ),
            //  )
          ],
        ),
      ),
    );
  }
}
