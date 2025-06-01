import 'package:flutter/material.dart';
import 'package:estate2/components/gap.dart';
import 'package:estate2/screens/property/property_details_page.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String price;
  final String description;
  final bool isBig;
  final bool isNetwork;

  const PropertyCard({
    Key? key,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.isBig,
    required this.isNetwork,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = isBig ? 280 : 200;
    final double width = isBig ? 300 : 240;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => PropertyDetailsPage(
              title: title,
              description: description,
              imageUrl: imageUrl,
              location: location,
              price: price,
              isNetwork: true,
              area: 100,
              bathrooms: 4,
              bedrooms: 4,
              rating: 4.5,
            ),
          ),
        );
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child:
              isNetwork
                  ? Image.network(
                imageUrl,
                height: isBig ? 180 : 120,
                width: width,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                imageUrl,
                height: isBig ? 180 : 120,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(isWidth: false, isHeight: true, height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                location,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


