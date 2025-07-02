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
              SizedBox(height: 40),
              Text(
                widget.ProductName,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(height: 60),
              Container(
                padding: EdgeInsets.all(15),
                child: Image.asset(widget.imageUrl),
                //width: 300,
                height: 300,
              ),
              SizedBox(height: 160),
              Text(
                '\$${widget.price}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              ColorChangingChip(chipLabels: ['7', '8', '9', '10']),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 0),
                  ),
                  backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (_) => Dialog(
                          backgroundColor: Color.fromRGBO(227, 227, 227, 1),
                          child: Lottie.asset('assets/add_to_cart_GIF.json'),
                        ),
                  );

                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pop(context); // Close the dialog
                  });

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
            ],
          ),
        ),
      ),
    );
  }
}
