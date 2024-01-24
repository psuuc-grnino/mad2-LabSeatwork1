import 'package:flutter/material.dart';
import 'package:ge_nino_mad2/product.dart';
import 'package:ge_nino_mad2/edit_product.dart';


class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool screen = true;

  List<Product> product = [
    Product(id: "SE1", name: "Samsung Galaxy Z Flip", price: 67000),
    Product(id: "SE2", name: "iPhone 15", price: 87000),
    Product(id: "SE3", name: "Xiaomi Pad 5", price: 20000)];

  void add(Product p) {
    setState(() {
      product.add(p);
    });
  }

  void clear(Product p) {
    setState(() {
      product.remove(p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                screen = true;
                int index=0;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => add_edit(
                            screen: screen, add: add, product: product, index:index,remove:clear),),);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (_, index) => InkWell(
                        child: ListTile(
                          leading: Icon(Icons.star),
                          title: Text('${product[index].name}'),
                        ),
                        onTap: () {
                          screen = false;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => add_edit(
                                      screen: screen,
                                      add: add,
                                      product: product,
                                      index: index,
                                      remove:clear),
                                      ),);
                        },
                      )),
            ),
          )
        ],
      ),
    );
  }
}
