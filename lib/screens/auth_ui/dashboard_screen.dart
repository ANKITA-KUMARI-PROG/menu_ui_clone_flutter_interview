import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shope_ab/screens/auth_ui/profile_screen.dart';
import 'package:shope_ab/screens/auth_ui/search_screen.dart';
import 'package:shope_ab/utils/app_constant.dart';

import 'coffee_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, dynamic>> _frequentlyVisited = [
    {
      'name': 'Sugar Tree Cafe',
      'rating': 4.9,
      'points': 10,
      'image': 'assets/images/cafe1.png',
    },
    {
      'name': 'Harpers Cafe',
      'rating': 4.9,
      'points': 20,
      'image': 'assets/images/cafe2.png',
    },
    {
      'name': 'Cafe La',
      'rating': 4.9,
      'points': 15,
      'image': 'assets/images/cafe3.png',
    },
    {
      'name': '10cm',
      'rating': 4.9,
      'points': 10,
      'image': 'assets/images/cafe4.png',
    },
  ];

  final List<Map<String, dynamic>> _highestReward = [
    {
      'name': 'Bean Vault Coffee',
      'rating': 4.9,
      'points': 30,
      'image': 'assets/images/cafe5.png',
    },
    {
      'name': 'Boonton Cofe5',
      'rating': 4.9,
      'points': 28,
      'image': 'assets/images/cafe.png',
    },
    {
      'name': '10cm',
      'rating': 4.9,
      'points': 20,
      'image': 'assets/images/cafe7.png',
    },
  ];

  final List<Map<String, dynamic>> _nearYou = [
    {
      'name': 'Semicolon Cafe',
      'rating': 4.9,
      'points': 20,
      'image': 'assets/images/cafe8.png',
    },
    {
      'name': 'Dwé safe',
      'rating': 4.9,
      'points': 18,
      'image': 'assets/images/cafe10.png',
    },
    {
      'name': '10cm',
      'rating': 4.9,
      'points': 20,
      'image': 'assets/images/cafe11.png',
    },
  ];

  final List<String> _categories = [
    'Cafe',
    'Restaurant',
    'Salon',
    'Coffee Shop',
  ];

  final List<Icon> foodIcons = [
    Icon(Icons.fastfood, color: Colors.orange),
    Icon(Icons.local_pizza, color: Colors.red),
    Icon(Icons.local_cafe, color: Colors.brown),
    Icon(Icons.icecream, color: Colors.pink),
    Icon(Icons.ramen_dining, color: Colors.amber),
    Icon(Icons.lunch_dining, color: Colors.green),
    Icon(Icons.local_dining, color: Colors.blue),
  ];

  final TextEditingController _searchController = TextEditingController();
  final PersistentTabController _navBarController = PersistentTabController(
    initialIndex: 0,
  );

  @override
  void dispose() {
    _searchController.dispose();
    _navBarController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _searchResults = [];

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear();
      } else {
        _searchResults = [..._frequentlyVisited, ..._highestReward, ..._nearYou]
            .where((place) {
              final name = place['name'].toString().toLowerCase();
              return name.contains(query.toLowerCase());
            })
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _navBarController,
        screens: _buildScreens(),
        items: _navBarsItems(size),
        confineToSafeArea: true,
        backgroundColor: AppConstant.appBackgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(16.0),
          colorBehindNavBar: AppConstant.appBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      _buildHomeScreen(),
      Center(child: Text("Coffee screen")),
      Center(child: Text("Contests Screen")),
      Center(child: Text("Favorites Screen")),
      Center(child: Text("Notifications Screen")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(Size size) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.event),
        title: ("Events"),
        activeColorPrimary: AppConstant.appPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.emoji_events),
        title: ("Contests"),
        activeColorPrimary: AppConstant.appPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          width: size.width * 0.16,
          height: size.width * 0.16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppConstant.appPrimaryColor,
          ),
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.08,
              height: size.width * 0.08,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: (''),
        activeColorPrimary: Colors.transparent,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: ("Favorites"),
        activeColorPrimary: AppConstant.appPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_none),
        title: ("Notifications"),
        activeColorPrimary: AppConstant.appPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  Widget _buildHomeScreen() {
    final size = MediaQuery.of(context).size;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppConstant.appBackgroundColor,
          appBar: AppBar(
            backgroundColor: AppConstant.appBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.person,
                color: AppConstant.appTextColor,
                size: size.height * 0.03,
              ),
              onPressed: () {
                Get.offAll(() => ProfileScreen());
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: AppConstant.appTextColor,
                  size: size.height * 0.03,
                ),
                onPressed: () {},
              ),
              SizedBox(width: size.width * 0.02),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                _buildSearchBar(size),
                SizedBox(height: size.height * 0.03),
                if (_searchResults.isNotEmpty) ...[
                  _buildSectionHeader("Search Results", size),
                  SizedBox(height: size.height * 0.02),
                  _buildPlaceList(_searchResults, size),
                ] else ...[
                  // Header with greeting and points
                  _buildHeaderSection(size),
                  SizedBox(height: size.height * 0.03),

                  // Trading banner
                  _buildTradingBanner(size),
                  SizedBox(height: size.height * 0.03),

                  // Categories
                  _buildCategoriesSection(size),
                  SizedBox(height: size.height * 0.03),

                  // Frequently Visited
                  _buildSectionHeader('Frequently Visited', size),
                  SizedBox(height: size.height * 0.02),
                  _buildPlaceList(_frequentlyVisited, size),
                  SizedBox(height: size.height * 0.03),

                  // Highest Reward Points
                  _buildSectionHeader('Highest Reward Points', size),
                  SizedBox(height: size.height * 0.02),
                  _buildPlaceList(_highestReward, size),
                  SizedBox(height: size.height * 0.03),

                  // Near You
                  _buildSectionHeader('Near You', size),
                  SizedBox(height: size.height * 0.02),
                  _buildPlaceList(_nearYou, size),
                  SizedBox(height: size.height * 0.03),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar(Size size) {
    return InkWell(
      onTap: () {
       Get.offAll(() => SearchScreen()
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        decoration: BoxDecoration(
          color: AppConstant.appCardColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppConstant.appTextColor,
              size: size.height * 0.025,
            ),
            SizedBox(width: size.width * 0.03),

            Expanded(
              child: TextField(
                onChanged: _onSearchChanged,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for cafes, restaurants...',
                  hintStyle: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: size.height * 0.016,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.filter_center_focus_rounded,
                color: AppConstant.appPrimaryColor,
                size: size.height * 0.025,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: AppConstant.appPrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Text(
              'Good Morning Bestie',
              style: AppConstant.textStyleTitle.copyWith(
                fontSize: size.height * 0.028,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.015),

            // Points message + reward box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Message
                Expanded(
                  child: Text(
                    'You may just imagine 200 exclusive\n'
                    'points for hitting the coffee and\n'
                    'Restaurants this month!',
                    style: AppConstant.textStyleNormal.copyWith(
                      fontSize: size.height * 0.016,
                      color: AppConstant.appTextColor,
                    ),
                  ),
                ),

                // Reward
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '200',
                      style: AppConstant.textStyleTitle.copyWith(
                        fontSize: size.height * 0.028,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.appPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Exclusive points',
                      style: AppConstant.textStyleNormal.copyWith(
                        fontSize: size.height * 0.012,
                        color: AppConstant.appTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTradingBanner(Size size) {
    final List<Map<String, String>> banners = [
      {
        "title": "Trading®",
        "badge": "Best",
        "offer": "50% OFF",
        "desc":
            "Buyers are more attractive. Easy to use options in wholesale and fair distribution agreements.",
        "image": "assets/images/cup.png",
      },
      {
        "title": "Coffee Deal",
        "badge": "Hot",
        "offer": "30% OFF",
        "desc": "Get your morning coffee at the best prices this month!",
        "image": "assets/images/cup.png",
      },
      {
        "title": "Special",
        "badge": "New",
        "offer": "Buy 1 Get 1",
        "desc": "Enjoy delicious meals with exclusive offers.",
        "image": "assets/images/cup.png",
      },
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.2,
        enlargeCenterPage: true,
        autoPlay: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.9999,
      ),
      items: banners.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Image.asset(
                  banner["image"]!,
                  height: size.height * 0.23,
                  width: size.width,
                  fit: BoxFit.contain,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      // Left content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Title + Badge
                            Row(
                              children: [
                                Text(
                                  banner["title"]!,
                                  style: AppConstant.textStyleBold.copyWith(
                                    fontSize: size.height * 0.018,
                                    color: AppConstant.appPrimaryColor,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.02),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025,
                                    vertical: size.height * 0.003,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppConstant.appSuccessColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    banner["badge"]!,
                                    style: AppConstant.textStyleBold.copyWith(
                                      fontSize: size.height * 0.012,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.008),
                            // Offer
                            Text(
                              banner["offer"]!,
                              style: AppConstant.textStyleTitle.copyWith(
                                fontSize: size.height * 0.026,
                                fontWeight: FontWeight.bold,
                                color: AppConstant.appPrimaryColor,
                              ),
                            ),
                            SizedBox(height: size.height * 0.008),
                            // Description
                            Text(
                              banner["desc"]!,
                              style: AppConstant.textStyleNormal.copyWith(
                                fontSize: size.height * 0.014,
                                color: AppConstant.appTextColor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCategoriesSection(Size size) {
    return SizedBox(
      height: size.height * 0.06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              right: size.width * 0.03,
              left: index == 0 ? size.width * 0.04 : 0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.01,
            ),
            decoration: BoxDecoration(
              gradient: index == 0
                  ? LinearGradient(
                      colors: [
                        AppConstant.appPrimaryColor,
                        AppConstant.appPrimaryColor,
                      ],
                    )
                  : null,
              color: index == 0 ? null : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppConstant.appPrimaryColor,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                foodIcons[index],
                Text(
                  _categories[index],
                  style: TextStyle(
                    fontSize: size.height * 0.015,
                    color: index == 0
                        ? Colors.white
                        : AppConstant.appPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.bold,
              color: AppConstant.appTextColor,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: size.height * 0.014,
                color: AppConstant.appPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceList(List<Map<String, dynamic>> places, Size size) {
    return SizedBox(
      height: size.height * 0.26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return Container(
            width: size.width * 0.35,
            height: size.height * 0.58,
            margin: EdgeInsets.only(
              top: size.height * 0.01,
              bottom: size.height * 0.01,
              left: index == 0 ? size.width * 0.04 : size.width * 0.02,
              right: index == places.length - 1 ? size.width * 0.04 : 0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Place image
                InkWell(
                  onTap: () {
                   Get.offAll(() =>  CoffeeDetailScreen(),
                      
                    );
                  },
                  child: Container(
                    height: size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(place['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.004,
                              vertical: size.height * 0.003,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.favorite,
                              size: 14,
                              color: AppConstant.appErrorColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place['name'],
                        style: TextStyle(
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.appTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: size.height * 0.005),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppConstant.appPrimaryColor,
                            size: size.height * 0.014,
                          ),
                          SizedBox(width: size.width * 0.005),
                          Text(
                            place['rating'].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.012,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${place['points']} Points',
                        style: TextStyle(
                          fontSize: size.height * 0.014,
                          fontWeight: FontWeight.w600,
                          color: AppConstant.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
