import 'package:flutter/material.dart';
import 'package:shoe_store/cart.dart';
import 'package:shoe_store/mainPageCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import 'cart_Changeprovider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> mainPageCards = [
// Main Page Discount Cads
      
      MainpageDiscountcards(
        imageUrl: 'assets/mainPage_card.png',
        discount: 20,
        name: 'Sports Shoes',
        price: 219,
      ),

      MainpageDiscountcards(
        imageUrl: 'assets/mainPage_card2.png',
        discount: 10,
        name: 'Comfort Sneakers',
        price: 320,
      ),

      MainpageDiscountcards(
        imageUrl: 'assets/mainPage_card3.png',
        discount: 30,
        name: 'Comfort Sneakers',
        price: 219,
      ),
    ];

    return ChangeNotifierProvider( // Provider (ChangeNotifierProvider -> State Management )
      create: (context) => CartChangeprovider(),
      child: MaterialApp(
        theme: ThemeData.light(useMaterial3: true),

        debugShowCheckedModeBanner: false, // To Remove Debug Sticker from Screen
        // Bottom Bar
        home: Scaffold(
          bottomNavigationBar: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, size: 32, color: Colors.amberAccent),
                Builder(
                  builder:
                      (innerContext) => GestureDetector(
                        onTap: () {
                          Navigator.of(
                            innerContext,
                          ).push(MaterialPageRoute(builder: (_) => CartPage()));
                        },
                        child: Icon(Icons.shopping_cart, size: 28),
                      ),
                ),
              ],
            ),
          ),
          // App Bar
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Image.asset('assets/logo.png', height: 50, width: 50),
                SizedBox(width: 10),
                Text(
                  'Nike',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                  ),
                ),
                SizedBox(width: 230),

                InkWell(child: Icon(Icons.person)),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Discount Cards
                    SizedBox(
                      height: 150,
                      child: SizedBox(
                        width: double.infinity,
                        child: CarouselSlider.builder(
                          itemCount: mainPageCards.length,
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1.0,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            return mainPageCards[index];
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
// Sorting Chips
                    ColorChangingChip(
                      chipLabels: ['All', 'Sports', 'Sneakers'],
                    ),
                    // Main Page Bottom Cards
                    MainPageBottomCards(
                      imageUrl1: 'assets/mainPage_card.png',
                      ProductName1: 'Sports Shoes',
                      price1: 219,
                      imageUrl2: 'assets/mainPage_card2.png',
                      ProductName2: 'Comfort Sneakers',
                      price2: 320,
                    ),
                    SizedBox(height: 8),
                    MainPageBottomCards(
                      imageUrl1: 'assets/mainPage_card3.png',
                      ProductName1: 'Comfort Sneakers',
                      price1: 219,
                      imageUrl2: 'assets/mainPage_card4.jpg',
                      ProductName2: 'Sports Shoes',
                      price2: 320,
                    ),
                    SizedBox(height: 8),
                    MainPageBottomCards(
                      imageUrl1: 'assets/mainPage_card5.jpg',
                      ProductName1: 'Air Sneakers',
                      price1: 219,
                      imageUrl2: 'assets/mainPage_card6.png',
                      ProductName2: 'Max Sneakers',
                      price2: 320,
                    ),
                    SizedBox(height: 8),
                    MainPageBottomCards(
                      imageUrl1: 'assets/mainPage_card7.png',
                      ProductName1: 'LifeStyle Sneakers',
                      price1: 219,
                      imageUrl2: 'assets/mainPage_card8.jpg',
                      ProductName2: 'Casual Sneakers',
                      price2: 320,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
