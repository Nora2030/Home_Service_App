import 'package:final_project/models/OfferModel.dart';
import 'package:flutter/material.dart';

class OfferItem extends StatelessWidget {
  final OfferModel offer;
  final VoidCallback onTap;

  const OfferItem({required this.offer, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0), // Add margins around the container
        height: MediaQuery.of(context).size.height *
            0.25, // Adjust height based on screen size
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(offer.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16.0,
              top: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        offer.offerName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.info_outline,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(offer.offerName),
                                content: Text(offer.offerInfo),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    offer.offerAmount,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: onTap,
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
