import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/small_app.dart/discoverTabbar/offers.dart';
import 'package:flutter_application_1/screens/small_app.dart/discoverTabbar/new_arrival.dart';
import 'package:flutter_application_1/screens/small_app.dart/discoverTabbar/best_seller.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF85BB),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [Text('New Arrivals'), Text('Best Sellers'), Text('Offers')],
          ),
        ),
        body: TabBarView(
          children: [NewArrivalScreen(), BestSellerScreen(), OffersScreen()],
        ),
      ),
    );
    
  }
}
