import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello 👋",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Indu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Search
              _buildSearchBar(),

              const SizedBox(height: 24),

              // Categories
              _buildSectionTitle(
                title: "Categories",
                action: "See All",
              ),

              const SizedBox(height: 16),

              _buildCategories(),

              const SizedBox(height: 24),

              // Banner
              _buildOfferBanner(),

              const SizedBox(height: 28),

              // Popular Products
              _buildSectionTitle(
                title: "Popular Products",
                action: "See All",
              ),

              const SizedBox(height: 16),

              _buildProducts(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // --------------------------------------------------
  // Search Bar
  // --------------------------------------------------

  Widget _buildSearchBar() {
    return Container(
      height: 52,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search products...",

          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),

          border: InputBorder.none,

          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // Section Title
  // --------------------------------------------------

  Widget _buildSectionTitle({
    required String title,
    required String action,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        TextButton(
          onPressed: () {},

          child: Text(
            action,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // Categories
  // --------------------------------------------------

  Widget _buildCategories() {
    final categories = [
      {
        "name": "Shoes",
        "icon": Icons.directions_run,
      },
      {
        "name": "Fashion",
        "icon": Icons.checkroom,
      },
      {
        "name": "Mobile",
        "icon": Icons.phone_android,
      },
      {
        "name": "Beauty",
        "icon": Icons.face,
      },
    ];

    return SizedBox(
      height: 100,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,

        itemBuilder: (context, index) {
          final category = categories[index];

          return Container(
            width: 80,

            margin: const EdgeInsets.only(
              right: 16,
            ),

            child: Column(
              children: [

                Container(
                  height: 60,
                  width: 60,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Icon(
                    category["icon"] as IconData,
                    size: 28,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  category["name"] as String,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --------------------------------------------------
  // Offer Banner
  // --------------------------------------------------

  Widget _buildOfferBanner() {
    return Container(
      height: 170,

      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF111111),
            Color(0xFF3A3A3A),
          ],
        ),

        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                const Text(
                  "BIG SALE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Up to 50% OFF",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),

                  child: const Text(
                    "Shop Now",
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.shopping_bag,
            size: 80,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // Products
  // --------------------------------------------------

  Widget _buildProducts() {
    final products = [
      {
        "name": "iPhone",
        "price": "₹79,999",
        "icon": Icons.phone_iphone,
      },
      {
        "name": "Sneakers",
        "price": "₹3,999",
        "icon": Icons.directions_run,
      },
      {
        "name": "Headphones",
        "price": "₹2,999",
        "icon": Icons.headphones,
      },
      {
        "name": "Smart Watch",
        "price": "₹5,999",
        "icon": Icons.watch,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,

      physics:
      const NeverScrollableScrollPhysics(),

      itemCount: products.length,

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 14,

        mainAxisSpacing: 14,

        childAspectRatio: 0.72,
      ),

      itemBuilder: (context, index) {
        final product = products[index];

        return _buildProductCard(
          name: product["name"] as String,
          price: product["price"] as String,
          icon: product["icon"] as IconData,
        );
      },
    );
  }

  // --------------------------------------------------
  // Product Card
  // --------------------------------------------------

  Widget _buildProductCard({
    required String name,
    required String price,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Expanded(
            child: Stack(
              children: [

                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),

                    borderRadius:
                    const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                  ),

                  child: Icon(
                    icon,
                    size: 80,
                    color: Colors.grey.shade700,
                  ),
                ),

                Positioned(
                  right: 10,
                  top: 10,

                  child: Container(
                    height: 36,
                    width: 36,

                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),

                    child: IconButton(
                      padding: EdgeInsets.zero,

                      onPressed: () {},

                      icon: const Icon(
                        Icons.favorite_border,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  name,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  price,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,

                  height: 38,

                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.black,

                      foregroundColor:
                      Colors.white,

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),

                    child: const Text(
                      "Add to Cart",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // Bottom Navigation
  // --------------------------------------------------

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,

      type: BottomNavigationBarType.fixed,

      onTap: (index) {},

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          label: "Wishlist",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: "Cart",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}