import 'package:flutter/material.dart';
import 'package:estate2/components/gap.dart';
import 'package:estate2/components/home/property_card.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  double maxPrice = 1000;
  String selectedLocation = 'All';
  bool isGrid = false;
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> properties = [
    {
      'title': 'Modern Apartment',
      'subtitle': 'New York',
      'image': 'lib/assets/images/property1.jpg',
      'price': '\$900',
      'description': 'A modern apartment in New York.'
    },
    {
      'title': 'Luxury Villa',
      'subtitle': 'California',
      'image': 'lib/assets/images/property2.jpg',
      'price': '\$1500',
      'description': 'A luxury villa with a pool.'
    },
    {
      'title': 'Cozy House',
      'subtitle': 'Texas',
      'image': 'lib/assets/images/slider5.png',
      'price': '\$700',
      'description': 'A cozy family house.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final query = searchController.text.trim().toLowerCase();

    final filteredProperties = properties.where((property) {
      final title = property['title'].toString().toLowerCase();
      final location = property['subtitle'].toString().toLowerCase();

      final matchesQuery = query.isEmpty ;
      title.contains(query) ;
      location.contains(query);
      final matchesLocation = selectedLocation == 'All' || location == selectedLocation.toLowerCase();

      final priceValue = double.tryParse(
          property['price']?.toString().replaceAll(RegExp(r'[^\d.]'), '') ??
              '') ??
          0;
      final priceMatches = priceValue <= maxPrice;

      return matchesQuery && matchesLocation && priceMatches;
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Search Results"),
          actions: [
            IconButton(
              icon: Icon(isGrid ? Icons.list : Icons.grid_view),
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
            )
          ],
        ),
        body: Padding(
        padding: const EdgeInsets.all(12.0),
    child: Column(
    children: [
    // 🔍 شريط البحث الموحد
    TextField(
    controller: searchController,
    onChanged: (_) => setState(() {}),
    decoration: InputDecoration(
    hintText: 'Search by name or location',
    prefixIcon: const Icon(Icons.search),
    filled: true,
    fillColor: Colors.green.shade50,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
    ),
    ),
    ),
    const Gap(isWidth: false, isHeight: true, height: 10),

    // 🔽 الفلاتر
    Row(
    children: [
    const Text(
    "Max Price:",
    style:
    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    ),
    Expanded(
    child: Slider(
    min: 100,
    max: 2000,
    divisions: 38,
    value: maxPrice,
    label: '\$${maxPrice.round()}',
    onChanged: (value) {
    setState(() {
    maxPrice = value;
    });
    },
    ),
    ),],
    ),
      const Gap(isWidth: false, isHeight: true, height: 10),
      Row(
        children: [
          const Text(
            "Location: ",
            style:
            TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: selectedLocation,
            items: ['All', 'New York', 'California', 'Texas']
                .map(
                  (location) => DropdownMenuItem(
                value: location,
                child: Text(location),
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedLocation = value!;
              });
            },
          ),
        ],
      ),
      const Gap(isWidth: false, isHeight: true, height: 12),

      // 🏠 عرض النتائج
      Expanded(
        child: isGrid
            ? GridView.builder(
          itemCount: filteredProperties.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final property = filteredProperties[index];
            return PropertyCard(
              title: property['title'],
              location: property['subtitle'],
              imageUrl: property['image'],
              price: property['price'] ?? 'N/A',
              description: property['description'] ?? '',
              isBig: false,
              isNetwork: false,
            );
          },
        )
            : ListView.builder(
          itemCount: filteredProperties.length,
          itemBuilder: (context, index) {
            final property = filteredProperties[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: PropertyCard(
                title: property['title'],
                location: property['subtitle'],
                imageUrl: property['image'],
                price: property['price'] ?? 'N/A',
                description: property['description'] ?? '',
                isBig: true,
                isNetwork: false,
              ),
            );
          },
        ),
      ),
    ],
    ),
        ),
    );
  }
}