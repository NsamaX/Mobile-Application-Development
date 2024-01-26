import 'package:flutter/material.dart';
import 'CustomStyles.dart';

class Product {
  final String image;
  final String name;
  final String description;
  final String size;
  final double price;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.size,
    required this.price,
  });
}

class SmallCoffeeCard extends StatefulWidget {
  final Product product;

  SmallCoffeeCard({
    required this.product,
  });

  @override
  _SmallCoffeeCardState createState() => _SmallCoffeeCardState();
}

class _SmallCoffeeCardState extends State<SmallCoffeeCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [
            CustomStyles.grey1,
            CustomStyles.grey1.withOpacity(0.0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                widget.product.image,
                width: 160.0,
                height: 160.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: CustomStyles.textStyle.copyWith(fontSize: 16.0),
                      ),
                      Text(
                        widget.product.description,
                        style: CustomStyles.textStyle.copyWith(
                          fontSize: widget.product.description.length > 1
                              ? 10.0
                              : 9.0,
                          color: widget.product.description.length > 1
                              ? CustomStyles.grey3
                              : CustomStyles.grey3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 75.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomStyles.grey1,
                        ),
                        child: Center(
                          child: Text(
                            widget.product.size,
                            style: CustomStyles.textStyle.copyWith(
                              fontSize: widget.product.description.length > 1
                                  ? 10.0
                                  : 16.0,
                              color: widget.product.description.length > 1
                                  ? CustomStyles.grey3
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: CustomStyles.textStyle.copyWith(
                              fontSize: 20.0,
                              color: CustomStyles.orange,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            widget.product.price.toStringAsFixed(2),
                            style: CustomStyles.textStyle.copyWith(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  QuantitySelector(
                    onChanged: (newQuantity) {
                      setState(() {
                        if (newQuantity > quantity) {
                          totalPrice.incrementTotalPrice(widget.product.price);
                        } else {
                          totalPrice.decrementTotalPrice(widget.product.price);
                        }
                        quantity = newQuantity;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LargeCoffeeCard extends StatefulWidget {
  final Product product;
  final List<Map<String, dynamic>> weightPrice;

  LargeCoffeeCard({
    required this.product,
    required this.weightPrice,
  });

  @override
  _LargeCoffeeCardState createState() => _LargeCoffeeCardState();
}

class _LargeCoffeeCardState extends State<LargeCoffeeCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [
            CustomStyles.grey1,
            CustomStyles.grey1.withOpacity(0.0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    widget.product.image,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: CustomStyles.textStyle.copyWith(fontSize: 16.0,),
                          ),
                          Text(
                            widget.product.description,
                            style: CustomStyles.textStyle.copyWith(
                              fontSize: widget.product.description.length > 1
                                  ? 10.0
                                  : 9.0,
                              color: widget.product.description.length > 1
                                  ? CustomStyles.grey3
                                  : CustomStyles.grey3,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: 120.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomStyles.grey1,
                        ),
                        child: Center(
                          child: Text(
                            widget.product.size,
                            style: CustomStyles.textStyle.copyWith(
                              fontSize: 10.0,
                              color: CustomStyles.grey3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: widget.weightPrice.map((sizeInfo) {
                final weight = sizeInfo['weight'];
                final price = sizeInfo['price'];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomStyles.grey1,
                        ),
                        child: Center(
                          child: Text(
                            weight,
                            style: CustomStyles.textStyle.copyWith(
                              fontSize: widget.product.description.length > 1
                                  ? 10.0
                                  : 16.0,
                              color: widget.product.description.length > 1
                                  ? CustomStyles.grey3
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              '\$',
                              style: CustomStyles.textStyle.copyWith(
                                fontSize: 20.0,
                                color: CustomStyles.orange,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              price.toStringAsFixed(2),
                              style: CustomStyles.textStyle.copyWith(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      QuantitySelector(
                        onChanged: (newQuantity) {
                          setState(() {
                            if (newQuantity > quantity) {
                              totalPrice.incrementTotalPrice(widget.product.price);
                            } else {
                              totalPrice.decrementTotalPrice(widget.product.price);
                            }
                            quantity = newQuantity;
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialQuantity;

  QuantitySelector({
    required this.onChanged,
    this.initialQuantity = 0,
  }) : assert(initialQuantity >= 0);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
      widget.onChanged(quantity);
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
        widget.onChanged(quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: decrementQuantity,
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: CustomStyles.orange,
            ),
            child: Center(
              child: Text(
                '-',
                style: CustomStyles.textStyle.copyWith(fontSize: 16.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Container(
            width: 60.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(width: 1, color: CustomStyles.orange),
              color: CustomStyles.grey1,
            ),
            child: Center(
              child: Text(
                '$quantity',
                style: CustomStyles.textStyle.copyWith(fontSize: 16.0),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: incrementQuantity,
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: CustomStyles.orange,
            ),
            child: Center(
              child: Text(
                '+',
                style: CustomStyles.textStyle.copyWith(fontSize: 16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TotalPrice extends ChangeNotifier {
  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  void updateTotalPrice(double price) {
    _totalPrice = price;
    notifyListeners();
  }

  void incrementTotalPrice(double price) {
    _totalPrice += price;
    notifyListeners();
  }

  void decrementTotalPrice(double price) {
    if (_totalPrice > 0) {
      _totalPrice -= price;
      notifyListeners();
    }
  }
}

class TotalPriceCardState extends StatefulWidget {
  @override
  _TotalPriceCardStateState createState() => _TotalPriceCardStateState();
}

class _TotalPriceCardStateState extends State<TotalPriceCardState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Total Price',
                style: CustomStyles.textStyle.copyWith(fontSize: 10.0),
              ),
              Row(
                children: [
                  Text(
                    '\$',
                    style: CustomStyles.textStyle.copyWith(
                      fontSize: 20.0,
                      color: CustomStyles.orange,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    totalPrice.totalPrice.toStringAsFixed(2),
                    style: CustomStyles.textStyle.copyWith(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 240.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: CustomStyles.orange,
            ),
            child: Center(
              child: Text(
                'Pay',
                style: CustomStyles.textStyle.copyWith(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TotalPrice totalPrice = TotalPrice();

class MyBottomNavigationBar extends StatelessWidget {
  final List<Map<String, dynamic>> button;

  MyBottomNavigationBar({
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      items: button.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon'] as IconData),
          label: item['label'] as String,
        );
      }).toList(),
      selectedItemColor: CustomStyles.orange,
      unselectedItemColor: CustomStyles.grey2,
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      CustomStyles.grey1,
                      CustomStyles.grey1.withOpacity(0.0),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: CustomStyles.grey1,
                  ),
                ),
                child: Icon(
                  Icons.window,
                  color: Color(0xFFFFFFFF).withOpacity(0.20),
                ),
              ),
              Container(
                child: Text(
                  'Cart',
                  style: CustomStyles.textStyle.copyWith(
                    fontSize: 20.0,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      width: 1.0,
                      color: CustomStyles.grey1,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/me.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          LargeCoffeeCard(
            product: Product(
              image: 'assets/images/coffee-01.png',
              name: 'Cappuccino',
              description: 'With Steamed Milk',
              size: 'Small Roasted',
              price: 4.20,
            ),
            weightPrice: [
              {'weight': 'S', 'price': 4.20},
              {'weight': 'M', 'price': 5.20},
              {'weight': 'L', 'price': 6.20},
            ],
          ),
          SmallCoffeeCard(
            product: Product(
              image: 'assets/images/coffee-01.png',
              name: 'Cappuccino',
              description: 'With Steamed Milk',
              size: 'M',
              price: 6.20,
            ),
          ),
          SmallCoffeeCard(
            product: Product(
              image: 'assets/images/coffee-01.png',
              name: 'Cappuccino',
              description: 'With Steamed Milk',
              size: 'M',
              price: 6.20,
            ),
          ),
          LargeCoffeeCard(
            product: Product(
              image: 'assets/images/coffee-01.png',
              name: 'Cappuccino',
              description: 'With Steamed Milk',
              size: 'Small Roasted',
              price: 4.20,
            ),
            weightPrice: [
              {'weight': 'S', 'price': 4.20},
              {'weight': 'M', 'price': 5.20},
              {'weight': 'L', 'price': 6.20},
            ],
          ),
          TotalPriceCardState(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        button: [
          // {'icon': Icons.home, 'label': ''},
          {'icon': Icons.shopping_bag, 'label': ''},
          {'icon': Icons.favorite, 'label': ''},
          {'icon': Icons.notifications, 'label': ''},
          // Add more NavigationBar here
        ],
      ),
    );
  }
}
