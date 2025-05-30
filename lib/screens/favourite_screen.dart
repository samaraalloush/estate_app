import 'package:flutter/material.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/components/gap.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<Map<String, dynamic>> favoriteEstates = [
      {
        "title": "Luxury Villa in Paris",
        "price": "\$1,200,000",
        "location": "Paris, France",
        "image":
        "https://images.unsplash.com/photo-1570129477492-45c003edd2be?auto=format&fit=crop&w=800&q=80",
      },
      {
        "title": "Modern Apartment in New York",
        "price": "\$850,000",
        "location": "Manhattan, NY",
        "image":
        "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80 ",
      },
      {
        "title": "Seaside House in Greece",
        "price": "\$950,000",
        "location": "Santorini, Greece",
        "image":
        "https://images.unsplash.com/photo-1600585153944-3ccde7c8c9be?auto=format&fit=crop&w=800&q=80 ",
      },
      {
        "title": "Minimalist Loft in Tokyo",
        "price": "\$730,000",
        "location": "Shibuya, Tokyo",
        "image":
         "https://images.unsplash.com/photo-1572120360610-d971b9b78828?auto=format&fit=crop&w=800&q=80 ",
      },
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Favorites"),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: favoriteEstates.isEmpty
            ? const Center(
          child: Text(
            "No favorites yet!",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : ListView.builder(
        padding: const EdgeInsets.all(16),
    itemCount: favoriteEstates.length,
    itemBuilder: (context, index) {
    final estate = favoriteEstates[index];
    return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 10,
    offset: const Offset(0, 4),
    ),
    ],
    ),
    child: Row(
    children: [
    ClipRRect(
    borderRadius: const BorderRadius.horizontal(
    left: Radius.circular(16),
    ),
    child: Image.network(
    estate["image"],
    width: width * 0.35,
    height: height * 0.15,
    fit: BoxFit.cover,
    ),
    ),
    Expanded(
    child: Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    estate["title"],
    style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    ),
    ),
    Gap(isWidth: false, isHeight: true, height: 5),
    Row(
    children: [
    const Icon(Icons.location_on,
    size: 16, color: Colors.grey),
    const SizedBox(width: 4),
    Expanded(
    child: Text(
    estate["location"],
    style: const TextStyle(fontSize: 14, color: Colors.grey),
    ),
    ),
    ],
    ),
      Gap(isWidth: false, isHeight: true, height: 5),
      Text(
        estate["price"],
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    ],
    ),
    ),
    ),
      IconButton(
        onPressed: () {
          // تحذفي من المفضلة لاحقاً
        },
        icon: const Icon(Icons.favorite, color: Colors.red),
      ),
    ],
    ),
    );
    },
        ),
    );
  }
}