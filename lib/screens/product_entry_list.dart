import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchUserProducts(CookieRequest request) async {
    // If the user is not logged in, return an empty list.
    if (!request.loggedIn) {
      return [];
    }

    final response = await request.get('http://localhost:8000/json/');

    List<ProductEntry> allProducts = [];
    for (var d in response) {
      if (d != null) {
        allProducts.add(ProductEntry.fromJson(d));
      }
    }

    // Assume the user ID is stored in jsonData with the key 'pk' after login.
    final loggedInUserId = request.jsonData?['pk'];
    if (loggedInUserId != null) {
      allProducts.removeWhere((product) => product.userId != loggedInUserId);
    }

    return allProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchUserProducts(request),
        builder: (context, AsyncSnapshot<List<ProductEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                request.loggedIn
                    ? 'You have no products yet.'
                    : 'Please login to see your products.',
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
