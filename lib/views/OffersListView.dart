import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/models/OfferModel.dart';
import 'package:final_project/views/offer_item.dart';
import 'package:final_project/widgets/selectD&T_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class OffersListView extends StatelessWidget {
  const OffersListView({super.key});

  Future<List<OfferModel>> _fetchOffers() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('offers').get();
    return querySnapshot.docs
        .map((doc) => OfferModel.fromFirestore(doc))
        .toList();
  }

  void _showOfferDetails(BuildContext context, OfferModel offer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 400, // Set maximum width for the container
              maxHeight: 600, // Set maximum height for the container
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  offer.offerName,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      offer.offerAmount,
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    const SizedBox(width: 8.0),
                    infoIcon(offer: offer),
                  ],
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.3, // Adjust height based on screen size
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(offer.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  offer.offerInfo,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                const getOfferButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OfferModel>>(
      future: _fetchOffers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No offers available'));
        } else {
          List<OfferModel> offers = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0), // Add vertical padding to the ListView
            itemCount: offers.length,
            itemBuilder: (context, index) {
              OfferModel offer = offers[index];
              return OfferItem(
                offer: offer,
                onTap: () => _showOfferDetails(context, offer),
              );
            },
          );
        }
      },
    );
  }
}
class getOfferButton extends StatelessWidget {
  const getOfferButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(); // Close the dialog
        showModalBottomSheet(
              context: context,
              builder: (context) {
                return const Selectdatetime();
              });
        
      },
      child: const Text('Get Offer'),
    );
  }
}

class infoIcon extends StatelessWidget {
  final OfferModel offer;

  const infoIcon({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(offer.offerName),
              content: Text(offer.offerInfo),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
