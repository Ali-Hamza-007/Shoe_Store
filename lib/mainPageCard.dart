import 'package:flutter/material.dart';
import 'product_detail.dart';

class MainpageDiscountcards extends StatelessWidget {
  late String imageUrl;
  late int discount;
  late double price;
  late String name;

  MainpageDiscountcards({
    super.key,
    required this.imageUrl,
    required this.discount,
    required this.price,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(227, 227, 227, 1),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  '$discount% Discount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('on your first purchase', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailPAge(
                            imageUrl: imageUrl,
                            ProductName: name,
                            price: price,
                          );
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                  ),
                  child: Text(
                    'Shop Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(imageUrl, height: double.infinity, width: 200),
        ],
      ),
    );
  }
}

class MainPageBottomCards extends StatelessWidget {
  String imageUrl1 = '';
  String ProductName1 = '';
  double price1 = 0;
  String imageUrl2 = '';
  String ProductName2 = '';
  double price2 = 0;
  MainPageBottomCards({
    super.key,
    required this.imageUrl1,
    required this.ProductName1,
    required this.price1,
    required this.imageUrl2,
    required this.ProductName2,
    required this.price2,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 190,
          height: 200,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailPAge(
                      imageUrl: imageUrl1,
                      ProductName: ProductName1,
                      price: price1,
                    );
                  },
                ),
              );
            },
            child: Card(
              color: const Color.fromRGBO(227, 227, 227, 1),
              child: Column(
                children: [
                  SizedBox(height: 130, child: Image.asset(imageUrl1)),
                  SizedBox(height: 10),
                  Text(
                    ProductName1,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$$price1',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 190,
          height: 200,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailPAge(
                      imageUrl: imageUrl2,
                      ProductName: ProductName2,
                      price: price2,
                    );
                  },
                ),
              );
            },
            child: Card(
              color: const Color.fromRGBO(227, 227, 227, 1),
              child: Column(
                children: [
                  SizedBox(height: 130, child: Image.asset(imageUrl2)),
                  SizedBox(height: 10),
                  Text(
                    ProductName2,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$$price2',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ColorChangingChip extends StatefulWidget {
  final List<String> chipLabels;
  const ColorChangingChip({super.key, required this.chipLabels});

  @override
  _ColorChangingChipState createState() => _ColorChangingChipState();
}

class _ColorChangingChipState extends State<ColorChangingChip> {
  int selectedIndex = 0; // Start with first chip selected

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(widget.chipLabels.length, (index) {
        bool isSelected =
            (selectedIndex == index); // For By_Default Chip of index # 0

        Color backgroundColor = isSelected ? Colors.black : Colors.white;
        Color textColor = isSelected ? Colors.white : Colors.black;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Chip(
            label: Text(
              widget.chipLabels[index],
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(8),
            side: BorderSide(color: Colors.grey.shade400),
          ),
        );
      }),
    );
  }
}
