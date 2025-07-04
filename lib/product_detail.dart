// ### Product Detail Page ###
// Column (
// . ProductDetail title , image Url , Sizes Chips , Price , Add To cart Button 
//);

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/cart_Changeprovider.dart';
import 'mainPageCard.dart';
import 'package:lottie/lottie.dart';

class ProductDetailPAge extends StatefulWidget {
  String imageUrl = '';
  String ProductName = '';
  double price = 0;
  ProductDetailPAge({
    super.key,
    required this.ProductName,
    required this.imageUrl,
    required this.price,
  });

  @override
  State<ProductDetailPAge> createState() => _ProductDetailPAgeState();
}

class _ProductDetailPAgeState extends State<ProductDetailPAge> {
  @override
  Widget build(BuildContext context) {
    List sizeList = const ['7', '8', '9', '10'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Detail',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(227, 227, 227, 1),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                widget.ProductName,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 45),

              Center(child: Image.asset(widget.imageUrl, height: 200)),

              SizedBox(height: 100),
              Spacer(),
              Text(
                '\$${widget.price}',

                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),

              ColorChangingChip(chipLabels: ['7', '8', '9', '10']),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(250, 48)),
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.blueAccent,
                    ),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevent closing by tapping outside
                      builder:
                          (_) => Dialog(
                            backgroundColor: Color.fromRGBO(227, 227, 227, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Lottie.asset(
                                'assets/add_to_cart_GIF.json',
                                repeat: false,
                              ),
                            ),
                          ),
                    );

                    // Close the dialog after 1 second
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pop(); // Safer pop
                    });

                    // Add product to cart using Provider
                    Provider.of<CartChangeprovider>(
                      context,
                      listen: false,
                    ).addProduct(
                      widget.imageUrl,
                      widget.ProductName,
                      widget.price,
                    );
                  },
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
