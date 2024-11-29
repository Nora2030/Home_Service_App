import 'package:final_project/screens/menu_page.dart';
import 'package:final_project/widgets/bookingDetails_widget.dart';
import 'package:final_project/widgets/selectD&T_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BockingsScreen extends StatelessWidget {
  BockingsScreen({
    super.key,
    this.dateTime,
    //required this.mycard
  });
  // CardinfoModel mycard;

  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Row(
      //     children: [
      //       VerticalDivider(
      //         thickness: 4,
      //       ),
      //       Text('Bookings'),
      //     ],
      //   ),
      // ),
      body: Expanded(
        child: Column(
          children: [
          const  CustomAppBar(
              currentPage: 'menu',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      height: 20,
                      width: 4,
                      decoration: BoxDecoration(
                          color: const Color(0xffCABDFF),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Bookings',
                      style: TextStyle(fontSize: 24, fontFamily: 'Inter'),
                    )
                  ]),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Padding(
                  //   padding: const EdgeInsets.only(left: 12),
                  //   child: Text(
                  //     'about',
                  //     style: TextStyle(fontFamily: 'Inter', fontSize: 15),
                  //   ),
                  // ),
                  const SizedBox(height: 15),
                  BookingdetailsWidget(
                      dateTime: DateTime(date.year, date.month, date.day,
                          time.hour, time.minute))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  Container(
//               height: 100,
//               width: 100,
//               child: Text(
//                 '  ${dateTime?.day}-${dateTime?.month}-${dateTime?.year}  ${dateTime?.toLocal().hour}:${dateTime?.toLocal().minute.toString()} ${mycard.cost} ${mycard.service}',
//                 style: TextStyle(
//                     fontSize: 14,
//                     color: Color.fromARGB(231, 26, 29, 31),
//                     fontWeight: FontWeight.bold),
//               ),
//             ),


