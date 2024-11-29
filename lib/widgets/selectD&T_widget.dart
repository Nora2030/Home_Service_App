import 'package:final_project/models/cardinfo_model.dart';
import 'package:final_project/screens/appointment_booked.dart';
import 'package:final_project/widgets/selectDate_widget.dart';
import 'package:final_project/widgets/selectTime_widget.dart';
import 'package:flutter/material.dart';


class Selectdatetime extends StatefulWidget {
  const Selectdatetime({super.key});

  @override
  State<Selectdatetime> createState() => _SelectdatetimeState();
}

class _SelectdatetimeState extends State<Selectdatetime> {
  DateTime date = DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 00, minute: 00);

  bool isButtonActive = false;
  late CardinfoModel mycard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 4,
                decoration: BoxDecoration(
                    color: const Color(0xffCABDFF),
                    borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('Select your Date & time?',
                  style: TextStyle(fontSize: 18, fontFamily: 'Inter'))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              DateTime? newdate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100));
              if (newdate == null) return;
              setState(() {
                date = newdate;
              });
            },
            child: selectDate_widget(),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              TimeOfDay? newtime =
                  await showTimePicker(context: context, initialTime: time);
              if (newtime == null) return;
              setState(() {
                time = newtime;
                isButtonActive = true;
              });
            },
            child: const selectTime_widget(),
          ),

          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                const Icon(Icons.date_range_outlined,
                    size: 22, color: Color.fromARGB(231, 26, 29, 31)),
                Text(
                  '  ${date.day}/${date.month}/${date.year}  ${time.hour}:${time.minute} ',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(231, 26, 29, 31),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 343,
              height: 48,
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const AppointmentBooked();
                              // BockingsScreen(
                              //     //mycard: CardinfoModel(),
                              //     dateTime: DateTime(date.year, date.month,
                              //         date.day, time.hour, time.minute));
                            },
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  surfaceTintColor: const Color(0xff6759FF),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                ),
                child: const Text(
                  'Book Now',
                ),
              ),
            ),
          ),

          //customButton()
        ],
      ),
    );
  }
}
 DateTime date = DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 00, minute: 00);
