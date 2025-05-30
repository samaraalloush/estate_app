import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estate2/components/app_input.dart';
import 'package:estate2/components/gap.dart';
import 'package:estate2/components/home/explore_card.dart';
import 'package:estate2/components/home/featured_card.dart';
import 'package:estate2/components/home/home_category.dart';
import 'package:estate2/components/home/home_header.dart';
import 'package:estate2/components/home/property_card.dart';
import 'package:estate2/components/home/row_title_home.dart';
import 'package:estate2/components/home/top_agent.dart';
import 'package:estate2/components/home/top_location.dart';
import 'package:estate2/components/shared/screen.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/screens/featured/featured_screen.dart';
import 'package:estate2/utils/route_name.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchInput = TextEditingController();
  final searchFocus = FocusNode();

  @override
  void dispose() {
    searchInput.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final smallGapW = width * 0.03;
    final mediumGapW = width * 0.05;
    final smallGapH = height * 0.02;
    final mediumGapH = height * 0.03;

    return Screen(
        isBackButton: false,
        isBottomTab: true,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const HomeHeader(),
    const Gap(
    isWidth: false,
    isHeight: true,
    height: 20,
    ),
    Row(
    children: [
    Text(
    "Hey",
    style: Theme.of(context).textTheme.displayLarge,
    ),
    Gap(
    isWidth: true,
    isHeight: false,
    width: smallGapW,
    ),
    Text(
    "Razu!",
    style: Theme.of(context).textTheme.displayLarge!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    ),
    ),
    ],
    ),
    Text(
    "Let's start exploring",
    style: Theme.of(context).textTheme.displaySmall,
    ),
    Gap(
    isWidth: false,
    isHeight: true,
    height: mediumGapH,
    ),
    AppInput(
    myController: searchInput,
    focusNode: searchFocus,
    onFiledSubmitedValue: (value) {},
    keyBoardType: TextInputType.text,
    leftIcon: true,
    icon: const Icon(Icons.search),
    isFilled: true,
    obscureText: false,
    hinit: "Find location...",
    onValidator: (value) {
    if (value.isEmpty) return;
    },
    ),
    Gap(
    isWidth: false,
    isHeight: true,
    height: mediumGapH,
    ),
    SizedBox(
    height: height / 12,
    width: double.infinity,
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
    const HomeCategory(title: "All", active: true),
    Gap(
    isWidth: true,
    isHeight: false,
    width: smallGapW,
    ),
    const HomeCategory(title: "House", active: false),
    Gap(
    isWidth: true,
    isHeight: false,
    width: smallGapW,
    ),
    const HomeCategory(title: "Townhouse", active: false),
    Gap(
    isWidth: true,
    isHeight: false,
    width: smallGapW,
    ),
    const HomeCategory(title: "Apparment", active: false),
    Gap(
    isWidth: true,
    isHeight: false,
    width: smallGapW,
    ),
    const HomeCategory(title: "Condo", active: false),
    ],
    ),
    ),
    Gap(
    isWidth: false,
    isHeight: true,
    height: smallGapH,
    ),
    SizedBox(
    height: height / 4,
    width: double.infinity,
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
    const PropertyCard(
    title: "Halloween Sale!",
    location: "New York",
    imageUrl: "lib/assets/images/property2.jpg",
    price: "\$500,000",
    description: "Spacious 3-bedroom house",
    isBig: false,
    isNetwork: false,
    ),
    Gap(
    isWidth: true,
    isHeight: false,
    width: smallGapH,
    ),
    const PropertyCard(
    title: "Townhouse Sale!",
    location: "California",
    imageUrl: "lib/assets/images/property1.jpg",
    price: "\$350,000",
    description: "Modern townhouse with garden",
    isBig: false,
    isNetwork: false,
    ),
    Gap(
    isWidth: true,
    isHeight: false,
    width: mediumGapW,
    ),
    const PropertyCard(
    title: "Summer Vacation",
    location: "Florida",
    imageUrl: "lib/assets/images/slider6.png",
    price: "\$450,000",
    description: "Beachfront summer house",
    isBig: false,
    isNetwork: false,
    ),
    ],
    ),
    ),
    Gap(
    isWidth: false,
    isHeight: true,
    height: smallGapH,
    ),
    RowTitleHome(
    title: "Featured Estates",
    subtitle: "view all",
    onPress: () {},
    ),
    Gap(
    isWidth: false,
    isHeight: true,
    height: smallGapH,
    ),
    SizedBox(
    height: height / 4,
    width: double.infinity,
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
    const FeaturedCard(
    path: "lib/assets/images/property2.jpg",
    category: "Appartment",
    title: "Sky Dandelions\nApartment",
    rating: "4.9",
    location: "Pabna, Bangladesh",
    payment: "10",
    ),
    Gap(
    isWidth: true,
    isHeight: false,
    width: mediumGapW,
    ),
    const FeaturedCard(
    path: "lib/assets/images/property1.jpg",
    category: "Appartment",
    title: "Sky Dandelions\nApartment",
    rating: "4.9",
    location: "Pabna, Bangladesh",
      payment: "10",
    ),
      Gap(
        isWidth: true,
        isHeight: false,
        width: mediumGapW,
      ),
      const FeaturedCard(
        path: "lib/assets/images/property.jpg",
        category: "Appartment",
        title: "Sky Dandelions\nApartment",
        rating: "4.9",
        location: "Pabna, Bangladesh",
        payment: "10",
      ),
    ],
    ),
    ),
          Gap(
            isWidth: false,
            isHeight: true,
            height: smallGapH,
          ),
          RowTitleHome(
            title: "Top Locations",
            subtitle: "explore",
            onPress: () {},
          ),
          Gap(
            isWidth: false,
            isHeight: true,
            height: smallGapH,
          ),
          SizedBox(
            height: height / 15,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const TopLocation(
                  path: "lib/assets/images/property.jpg",
                  location: "Bali",
                ),
                Gap(
                  isWidth: true,
                  isHeight: false,
                  width: smallGapW,
                ),
                const TopLocation(
                  path: "lib/assets/images/property1.jpg",
                  location: "Jakartha",
                ),
                Gap(
                  isWidth: true,
                  isHeight: false,
                  width: smallGapW,
                ),
                const TopLocation(
                  path: "lib/assets/images/property2.jpg",
                  location: "Yogartha",
                ),
                Gap(
                  isWidth: true,
                  isHeight: false,
                  width: smallGapW,
                ),
              ],
            ),
          ),
          Gap(
            isWidth: false,
            isHeight: true,
            height: mediumGapH,
          ),
          RowTitleHome(
            title: "Top Estate Agent",
            subtitle: "explore",
            onPress: () {},
          ),
          Gap(
            isWidth: false,
            isHeight: true,
            height: smallGapH,
          ),
          SizedBox(
            height: height / 8.5,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const TopAgent(
                  path: "lib/assets/images/profile.png",
                  name: "Amanda",
                ),
                Gap(
                  isWidth: true,
                  isHeight: false,
                  width: smallGapW,
                ),
                const TopAgent(
                  path: "lib/assets/images/profile1.png",
                  name: "Andserson",
                ),
                Gap(
                  isWidth: true,
                  isHeight: false,
                  width: smallGapW,
                ),
                const TopAgent(
                  path: "lib/assets/images/profile2.png",
                  name: "Samantha",
                ),
              ],
            ),
          ),
          Gap(
            isWidth: false,
            isHeight: true,
            height: mediumGapH,
          ),
        ],
        ),
    );
  }
}