import 'package:final_project/models/cardinfo_model.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable, camel_case_types
class servicesCard_widget extends StatelessWidget {
  servicesCard_widget({
    required this.mycard,
    this.onTap,
    super.key,
  });
  VoidCallback? onTap;

  CardinfoModel mycard;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image(
                      image: AssetImage(mycard.image!),
                      height: 150,
                      width: 150,
                    )),
                Padding(
                  padding:const EdgeInsets.only(left: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                         const Icon(Icons.star, color: Color(0xffFFC554), size: 17),
                         const  SizedBox(
                            width: 7,
                          ),
                          Text(
                            mycard.rate!,
                            style:const  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        mycard.service!,
                        style:const  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 12,
                        ),
                      ),
                      const Text(
                        'Starts From',
                        style: TextStyle(
                            color: Color(0xff9A9FA5),
                            fontSize: 12,
                            fontFamily: 'Inter'),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0XFFB5E4CA)),
                        height: 20,
                        width: 80,
                        child: Text(
                          mycard.cost!,
                          style:const TextStyle(fontSize: 12, fontFamily: 'Inter'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
           const  Divider(
              thickness: 1,
              color: Color(0xffEFEFEF),
            )
          ],
        ),
      ),
    );
  }
}
