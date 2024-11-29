import 'package:flutter/material.dart';
import 'package:final_project/models/cardinfo_model.dart';
import 'package:final_project/widgets/selectD&T_widget.dart';
import 'package:final_project/widgets/serviceCard_widget.dart';

class SubCategory_screen extends StatelessWidget {
  SubCategory_screen({super.key});
  final List<CardinfoModel> cardlist = [
    CardinfoModel(
        cost: '250 EGP',
        image: 'assets/AC_Service/Ac_checkUp.jpeg',
        rate: '4.8',
        service: 'AC Check-Up'),
    CardinfoModel(
        cost: '300 EGP',
        image: 'assets/AC_Service/Ac_regular.jpeg',
        rate: '4.5',
        service: 'AC Regular Service'),
    CardinfoModel(
        cost: '300 EGP',
        image: 'assets/AC_Service/Ac_installution.jpeg',
        rate: '4.5',
        service: 'AC Installation'),
    CardinfoModel(
        cost: '280 EGP',
        image: 'assets/AC_Service/Ac_unistallution.jpeg',
        rate: '4.5',
        service: 'AC Uninstallation'),
    CardinfoModel(
        cost: '280 EGP',
        image: 'assets/AC_Service/Ac_unistallution.jpeg',
        rate: '4.5',
        service: 'AC Uninstallation'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'AC Repair',
            style: TextStyle(fontSize: 24, fontFamily: 'Inter'),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Divider(
              thickness: 1,
              color: Color(0xffEFEFEF),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return servicesCard_widget(
                      mycard: cardlist[index],
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const Selectdatetime( )
                              ;
                            });
                      });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
