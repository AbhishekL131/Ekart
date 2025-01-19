
import 'package:flutter/material.dart';
import 'package:ekart/global_variables.dart'; // Import your global variables (assuming it includes `products`)
import 'package:ekart/product_card.dart';
import 'package:ekart/product_details_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata'
  ];

  late String selectedFilter;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0]; // Initialize selected filter to 'All'
  }

  List<Map<String, Object>> get filteredProducts {
    return products.where((product) {
      final String brand = product['company'] as String; // Ensure 'brand' is treated as String
      final String title = product['title'] as String? ?? ''; // Handle null title gracefully

      if (selectedFilter == 'All') {
        // Show all products when 'All' filter is selected
        return title.toLowerCase().contains(searchQuery.toLowerCase());
      } else {
        // Show products matching the selected brand and search query
        return brand.toLowerCase() == selectedFilter.toLowerCase() &&
            title.toLowerCase().contains(searchQuery.toLowerCase());
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Shoekart",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.menu, size: 30, color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    label: Text(
                      "Search for Shoes",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        label: Text(filter),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: const Color.fromRGBO(245, 247, 249, 1),
                        ),
                        backgroundColor:
                        selectedFilter == filter ? Colors.blueAccent : const Color.fromRGBO(245, 247, 249, 1),
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: selectedFilter == filter ? Colors.white : Colors.black,
                        ),
                        elevation: 10,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor:
                      index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                },
                itemCount: filteredProducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
