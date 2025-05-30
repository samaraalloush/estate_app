import 'package:flutter/material.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/components/gap.dart';

class PropertyDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final String price;
  final bool isNetwork;

  const PropertyDetailsPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.price,
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
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.whiteColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(isWidth: false, isHeight: true, height: height * 0.015),

                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Gap(isWidth: false, isHeight: true, height: height * 0.02),

                  Text(
                    "\$$price",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(isWidth: false, isHeight: true, height: height * 0.03),

                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(isWidth: false, isHeight: true, height: height * 0.01),

                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Gap(isWidth: false, isHeight: true, height: height * 0.04),

                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      ),
                      onPressed: () {
                        // Action: Ex. Start chat, contact seller, etc.
                      },
                      child: Text(
                        "Contact Seller",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}