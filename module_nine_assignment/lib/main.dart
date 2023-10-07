import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module Nine Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int itemCount1 = 0;
  int itemCount2 = 0;
  int itemCount3 = 0;
  double unitPrice = 51.00;

  double getTotalAmount() {
    return (itemCount1 + itemCount2 + itemCount3) * unitPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Module Nine Assignment"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement your search functionality here.
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ProductCard(
              imageSrc:
                  'https://m.media-amazon.com/images/I/51UEDDJwGbL._AC_UY580_.jpg',
              title: 'Pullover',
              color: 'Blue',
              size: 'M',
              price: unitPrice,
              itemCount: itemCount1,
              onIncrement: () {
                setState(() {
                  itemCount1++;
                });
              },
              onDecrement: () {
                setState(() {
                  if (itemCount1 > 0) {
                    itemCount1--;
                  }
                });
              },
            ),
            ProductCard(
              imageSrc:
                  'https://images.lululemon.com/is/image/lululemon/LM3EM5S_031382_1?size=400,400',
              title: 'T-Shirt',
              color: 'Black',
              size: 'L',
              price: unitPrice,
              itemCount: itemCount2,
              onIncrement: () {
                setState(() {
                  itemCount2++;
                });
              },
              onDecrement: () {
                setState(() {
                  if (itemCount2 > 0) {
                    itemCount2--;
                  }
                });
              },
            ),
            ProductCard(
              imageSrc:
                  'https://ae01.alicdn.com/kf/HTB1dbSiXovrK1RjSspcq6zzSXXau/Quick-Dry-Women-Short-Sleeve-Sports-T-shirt-Fitness-Yoga-Runnning-Athletic-Tee-Outdoor.jpg',
              title: 'Sport Dress',
              color: 'Green',
              size: 'S',
              price: unitPrice,
              itemCount: itemCount3,
              onIncrement: () {
                setState(() {
                  itemCount3++;
                });
              },
              onDecrement: () {
                setState(() {
                  if (itemCount3 > 0) {
                    itemCount3--;
                  }
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount: ',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '${getTotalAmount().toStringAsFixed(2)}\$',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                color: Colors.transparent,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Congratulations! Your order has been placed.'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(
                        255, 247, 16, 0), // Set background color to red
                    minimumSize: const Size(150, 50), // Set button size
                  ),
                  child: const Text(
                    'CHECK OUT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageSrc;
  final String title;
  final String color;
  final String size;
  final double price;
  final int itemCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductCard({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.color,
    required this.size,
    required this.price,
    required this.itemCount,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Image.network(
          imageSrc,
          width: 100,
          height: 100,
          fit: BoxFit.fitWidth,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Column(
              children: [
                SizedBox(width: 10),
              ],
            ),
            const Icon(Icons.more_vert), // Three-dot icon
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    'Color:',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    color,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    'Size:',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    size,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: onDecrement,
                        color: Colors.red, // Minus icon color
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(itemCount.toString()),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: onIncrement,
                        color: Colors.green, // Plus icon color
                      ),
                    ),
                  ],
                ),
                Text(
                  '$price\$',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
