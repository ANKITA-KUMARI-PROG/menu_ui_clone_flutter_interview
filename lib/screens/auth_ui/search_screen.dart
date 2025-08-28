import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shope_ab/screens/auth_ui/dashboard_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  /// Static search history
  final List<String> _history = ["Coffee", "Black Coffee", "Mocha", "Latte"];

  /// All businesses
  final List<Map<String, String>> _businesses = [
    {
      "image": "assets/images/cafe1.png",
      "name": "Cafe Coffee Day",
      "category": "Coffee Shop",
      "rating": "4.9",
      "distance": "100m",
    },
    {
      "image": "assets/images/cafe2.png",
      "name": "Morning Vibes",
      "category": "Coffee Shop",
      "rating": "4.9",
      "distance": "190m",
    },
    {
      "image": "assets/images/cafe3.png",
      "name": "Ordinary Burgers",
      "category": "Burger Coffee Shop",
      "rating": "4.9",
      "distance": "190m",
    },
  ];

  /// Filtered results
  List<Map<String, String>> _searchResults = [];

  /// Search logic
  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear();
      } else {
        _searchResults = _businesses.where((place) {
          final name = place["name"]!.toLowerCase();
          final category = place["category"]!.toLowerCase();
          return name.contains(query.toLowerCase()) ||
              category.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppConstant.appSecondaryColorblack),
          onPressed: () => Get.offAll(() => DashboardScreen()),
        ),
        title: Text(
          "Search Local",
          style: AppConstant.textStyleTitle.copyWith(
            fontSize: size.height * 0.022,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.black),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: "Search cafes, restaurants...",
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            _onSearchChanged("");
                          },
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),

            /// If searching → show results
            if (_searchResults.isNotEmpty) ...[
              Text(
                "Search Results",
                style: AppConstant.textStyleBold.copyWith(
                  fontSize: size.height * 0.018,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final place = _searchResults[index];
                    return _buildBusinessCard(
                      size,
                      image: place["image"]!,
                      name: place["name"]!,
                      category: place["category"]!,
                      rating: place["rating"]!,
                      distance: place["distance"]!,
                    );
                  },
                ),
              ),
            ] else ...[
             
              // ignore: unnecessary_to_list_in_spreads
              ..._history.map((h) => _buildSearchHistory(size, h)).toList(),
              SizedBox(height: size.height * 0.02),
              Text(
                "Recently Searched Businesses",
                style: AppConstant.textStyleBold.copyWith(
                  fontSize: size.height * 0.018,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Expanded(
                child: ListView.builder(
                  itemCount: _businesses.length,
                  itemBuilder: (context, index) {
                    final place = _businesses[index];
                    return _buildBusinessCard(
                      size,
                      image: place["image"]!,
                      name: place["name"]!,
                      category: place["category"]!,
                      rating: place["rating"]!,
                      distance: place["distance"]!,
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Search History Item
  Widget _buildSearchHistory(Size size, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.004),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 18),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Text(
              text,
              style: AppConstant.textStyleNormal.copyWith(
                fontSize: size.height * 0.016,
              ),
            ),
          ),
          const Icon(Icons.close, color: Colors.grey, size: 18),
        ],
      ),
    );
  }




  /// Business Card Widget
  Widget _buildBusinessCard(Size size,
      {required String image,
      required String name,
      required String category,
      required String rating,
      required String distance}) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.015),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: size.width * 0.18,
              height: size.width * 0.18,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppConstant.textStyleTitle.copyWith(
                    fontSize: size.height * 0.018,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  category,
                  style: AppConstant.textStyleNormal.copyWith(
                    fontSize: size.height * 0.015,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.green, size: 16),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      rating,
                      style: AppConstant.textStyleNormal.copyWith(
                        fontSize: size.height * 0.014,
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    const Icon(Icons.location_on, color: Colors.green, size: 16),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      distance,
                      style: AppConstant.textStyleNormal.copyWith(
                        fontSize: size.height * 0.014,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
