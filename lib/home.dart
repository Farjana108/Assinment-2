import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List allItemCard = [
  {
    'ItemName': 'T-Shirt',
    'ItemImage':
        'https://images.unsplash.com/photo-1571945153237-4929e783af4a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'ItemPrice': 40,
    'ItemColor': 'White',
    'ItemSize': 'XL',
    'Quantity': 1,
  }, {
    'ItemName': 'PulLover',
    'ItemImage':
        'https://images.unsplash.com/photo-1618517351616-38fb9c5210c6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHQlMjBzaGlydHxlbnwwfHwwfHx8MA%3D%3D',
    'ItemPrice': 30,
    'ItemColor': 'black',
    'ItemSize': 'm',
    'Quantity': 1,
  }, {
    'ItemName': 'soprt deress',
    'ItemImage':
        'https://images.unsplash.com/photo-1554568218-0f1715e72254?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dCUyMHNoaXJ0fGVufDB8fDB8fHww',
    'ItemPrice': 50,
    'ItemColor': 'Pink',
    'ItemSize': 'm',
    'Quantity': 1,
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int get totalAmount {
    return allItemCard.fold<int>(
        0,
        (total, product) =>
            total + product['ItemPrice'] * product['Quantity'] as int);
  }

  @override
  Widget build(BuildContext context) {
    var myDilogBox = Dialog(
      child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Congratulations!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              const Text('You Have added'),
              const SizedBox(height: 5),
              const Text('5'),
              const SizedBox(height: 5),
              const Text('T-Shirt on your bag'),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 44),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OKAY')),
              )
            ],
          )),
    );

    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xffE5E5E5),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allItemCard.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: NetworkImage(
                                allItemCard[index]['ItemImage'],
                              ),
                              height: 100,
                              width: 100,
                              fit: BoxFit.fitWidth,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            allItemCard[index]['ItemName']
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        const Icon(Icons.more_vert),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          'Color: ${allItemCard[index]['ItemColor'].toString()}',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Size: ${allItemCard[index]['ItemSize'].toString()}',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              child: const CircleAvatar(
                                                minRadius: 15,
                                                backgroundColor: Colors.grey,
                                                child: Icon(
                                                  CupertinoIcons.minus,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              onTap: () {
                                                if (allItemCard[index]
                                                        ['Quantity'] >
                                                    1) {
                                                  allItemCard[index]
                                                      ['Quantity'] -= 1;
                                                }
                                                setState(() {});
                                              },
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                                allItemCard[index]['Quantity']
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 18)),
                                            const SizedBox(width: 10),
                                            InkWell(
                                              child: const CircleAvatar(
                                                maxRadius: 15,
                                                backgroundColor: Colors.grey,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              onTap: () {
                                                if (allItemCard[index]
                                                        ['Quantity'] ==
                                                    4) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          myDilogBox);
                                                }
                                                allItemCard[index]
                                                    ['Quantity'] += 1;
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$${allItemCard[index]['ItemPrice'] * allItemCard[index]['Quantity']}',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$${totalAmount.toString()}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 44),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ))),
              child: const Text('CHECK OUT'),
            )
          ],
        ),
      ),
    );
  }
}
