import 'package:flutter/material.dart';

class BookingdetailsWidget extends StatelessWidget {
  BookingdetailsWidget({super.key, required DateTime dateTime});
  dynamic dateTime;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ]),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Selected Service',
                    style: TextStyle(
                        fontFamily: 'inter', fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  )
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined,
                          size: 22, color: Color.fromARGB(231, 26, 29, 31)),
                      Text(
                        '   ${dateTime?.day}-${dateTime?.month}-${dateTime?.year}  ',

                        //  ${mycard.cost} ${mycard.service}

                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(231, 26, 29, 31),
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.timelapse,
                        size: 24,
                        color: Color(0xff434355),
                      ),
                      Text(
                        '  ${dateTime?.toLocal().hour}:${dateTime?.toLocal().minute.toString()}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(231, 26, 29, 31),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
              trailing: const CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage('assets/AC_Service/Ac_checkUp.jpeg'),
              ),
            ),

// ScheduleCard(date: date, day: day, time: time),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                thickness: 1,
                height: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xff6759FF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xff6759FF),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
  
//   class ScheduleCard extends StatelessWidget {
//   const ScheduleCard(
//       {Key? key, required this.date, required this.day, required this.time})
//       : super(key: key);
//   final String date;
//   final String day;
//   final String time;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           const Icon(
//             Icons.calendar_today,
            
//             size: 15,
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Text(
//             '$day, $date',
//             style: const TextStyle(
//              // color: Config.primaryColor,
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           const Icon(
//             Icons.access_alarm,
//             //color: Config.primaryColor,
//             size: 17,
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Flexible(
//               child: Text(
//             time,
//             style: const TextStyle(
//              // color: Config.primaryColor,
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/bookinginfo_model.dart';

// // ignore: must_be_immutable
// class BookingCard extends StatelessWidget {
//   BookingCard({super.key, required this.bookinginfoModel});
//   BookinginfoModel bookinginfoModel;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 bookinginfoModel.title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                 ),
//               ),
//               //  const   Text(
//               //       'Reference Code: #referenceCode',
//               //       style:  TextStyle(
//               //         color: Colors.grey,
//               //       ),
//               //     ),
//               const SizedBox(height: 8.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     bookinginfoModel.status,
//                     style: TextStyle(
//                       color: bookinginfoModel.status == 'Confirmed'
//                           ? Colors.green
//                           : Colors.red,
//                     ),
//                   ),
//                   Text(
//                     bookinginfoModel.schedule,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   // SizedBox(
//                   //   child: Image.asset('assets/default_image.jpg'),
//                   //   width: 30,
//                   //   height: 40,
//                   // ),
//                   // ClipRRect(
//                   //     child: Image.asset('assets/default_image.jpg'),
//                   //     borderRadius: BorderRadius.circular(3))
//                   // SvgPicture.asset(
//                   //   'assets/westinghouse_logo.svg', // Replace with your logo path
//                   //   width: 50.0,
//                   //   height: 50.0,
//                   // ),

//                   //  const SizedBox(width: 16.0),
//                   Text(
//                     bookinginfoModel.serviceProvider,
//                     style: const TextStyle(
//                       color: Color(0xff6759FF),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text(' will contact with you soon'),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.delete),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
