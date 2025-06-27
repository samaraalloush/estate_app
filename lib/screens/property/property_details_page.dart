import 'package:flutter/material.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/components/gap.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final String price;
  final double area;
  final int bedrooms;
  final int bathrooms;
  final double rating;
  final bool isNetwork;
  final String sallerName;
  final String sallerPhone;
  final String propertyType;

  const PropertyDetailsPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.area,
    required this.bedrooms,
    required this.bathrooms,
    required this.sallerName,
    required this.sallerPhone,
    required this.propertyType,
    this.rating = 4.5,
    this.isNetwork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Property Details",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.whiteColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        actions: [
          IconButton(
            onPressed: () {
              // Add to favorites
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      // Image
      Container(
      height: height * 0.3,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: isNetwork
              ? NetworkImage(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),

    // Details
    Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(title,
    style: Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(fontWeight: FontWeight.bold)),
    Gap(isHeight: true, isWidth: false, height: height * 0.01),

    // Location + map icon
    Row(
    children: [
    const Icon(Icons.location_on,
    size: 18, color: Colors.grey),
    const SizedBox(width: 4),
    Expanded(
    child: Text(location,
    style: Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Colors.grey[600])),
    ),
    IconButton(
    icon: const Icon(Icons.map,
    color: AppColors.primaryColor),
    onPressed: () async {
    final encodedLocation =
    Uri.encodeComponent(location);
    final mapUrl =
    'https://www.google.com/maps/search/?api=1&query=$encodedLocation';
    if (await canLaunchUrl(Uri.parse(mapUrl))) {
    await launchUrl(Uri.parse(mapUrl));
    } else {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text("Could not open map")),
    );
    }
    },
    )
    ],
    ),

    Gap(isHeight: true, isWidth: false, height: height * 0.015),

    // ✅ السعر + نوع العقار
    Row(
    children: [
    Text("\$$price",
    style: Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold)),
    const SizedBox(width: 12),
    Container(
    padding:
    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
    color: propertyType == 'rent'
    ? Colors.orange
        : Colors.green,
    borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
    propertyType == 'rent' ? 'For Rent' : 'For Sale',
    style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    )
    ],
    ),

    Gap(isHeight: true, isWidth: false, height: height * 0.02),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    _buildFeature(Icons.king_bed, "$bedrooms Beds"),
    _buildFeature(Icons.bathtub, "$bathrooms Baths"),
    _buildFeature(Icons.square_foot, "$area m²"),
    ],
    ),

    Gap(isHeight: true, isWidth: false, height: height * 0.02),

    Row(
    children: [
    RatingBarIndicator(
    rating: rating,
    itemBuilder: (context, _) =>
    const Icon(Icons.star, color: Colors.amber),
    itemCount: 5,
    itemSize: 24.0,
    direction: Axis.horizontal,
    ),
    const SizedBox(width: 8),
    Text("($rating/5)"),
    ],
    ),

    Gap(isHeight: true, isWidth: false, height: height * 0.03),

    Text("Description",
    style: Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.w600)),

    Gap(isHeight: true, isWidth: false, height: height * 0.01),

    Text(description, style: Theme.of(context).textTheme.bodyMedium),

    Gap(isHeight: true, isWidth: false, height: height * 0.04),

    Text("Seller Info",
    style: Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.w600)),

    Gap(isHeight: true, isWidth: false, height: height * 0.01),

    Text("Name: $sallerName"),
    Text("Phone: $sallerPhone"),
      Gap(isHeight: true, isWidth: false, height: height * 0.02),

      Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textPrimary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(
                horizontal: 40, vertical: 14),
          ),
          onPressed: () async {
            final telUrl = "tel:$sallerPhone";
            if (await canLaunchUrl(Uri.parse(telUrl))) {
              await launchUrl(Uri.parse(telUrl));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Could not initiate call")),
              );
            }
          },
          child: Text("Call Seller",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.whiteColor)),
        ),
      ),
    ],
    ),
    ),
      ],
      ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}