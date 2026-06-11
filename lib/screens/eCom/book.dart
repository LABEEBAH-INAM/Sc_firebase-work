import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class eCommerceBook extends StatefulWidget {
  const eCommerceBook({super.key});

  @override
  State<eCommerceBook> createState() => _eCommerceBookState();
}

class _eCommerceBookState extends State<eCommerceBook> {
  int activeIndex = 0;

  final List<String> images = [
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  final List<Map<String, String>> categories = [
    {'img': 'assets/images/fiction.png', 'name': 'Fiction'},
    {'img': 'assets/images/edu2.png', 'name': 'Education'},
    {'img': 'assets/images/tech.png', 'name': 'Tech'},
    {'img': 'assets/images/science.png', 'name': 'Science'},
    {'img': 'assets/images/children.png', 'name': 'Children'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: const Text('E_Commerce Platform'),
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(CupertinoIcons.search),
                suffixIcon: Icon(Icons.filter_list),
                border: InputBorder.none,
              ),
            ),
          ),

          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: 150,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            items: images.map((image) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 10),

          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: images.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.pink,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),

          const ListTile(
            title: Text('Categories'),
            trailing: Text('Show all', style: TextStyle(color: Colors.indigo)),
          ),

          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(categories[index]['img']!),
                      ),
                      Text(categories[index]['name']!),
                    ],
                  ),
                );
              },
            ),
          ),

          const ListTile(
            title: Text('Products'),
            trailing: Text('Show all', style: TextStyle(color: Colors.indigo)),
          ),

          // GridView.count(
          //   crossAxisCount: 2,
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   children: [
          //     Image.asset('assets/images/education.png'),
          //     Text(
          //       'Best books are available ',
          //       style: Theme.of(context).textTheme.titleLarge,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

// Widget _buildExampleCard(String title, Widget child) {
//   return Card(
//     child: Column(
//       children: [

//       ],
//     ),
//   );
// }
