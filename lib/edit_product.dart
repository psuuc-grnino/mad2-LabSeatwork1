import 'package:flutter/material.dart';
import 'package:ge_nino_mad2/product.dart';

// ignore: must_be_immutable
class add_edit extends StatelessWidget {
  add_edit(
      {super.key,
      required this.screen,
      required this.add,
      required this.product,
      required this.index,
      required this.remove});
  bool screen;
  Function(Product p) add;
  Function(Product p) remove;
  List<Product> product;
  int index;

  void insert() {
    add(Product(
        id: productCodecontrol.text,
        name: productNamecontrol.text,
        price: double.parse(productpricecontrol.text)));
  }

  void edit() {
    remove(Product(
        id: productCodecontrol.text,
        name: productNamecontrol.text,
        price: double.parse(productpricecontrol.text)));
  }

  var productCodecontrol = TextEditingController();
  var productCodecontrol1 = TextEditingController();
  var productNamecontrol = TextEditingController();
  var productpricecontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (!screen) {
      productCodecontrol.text = product[index].id;
      productNamecontrol.text = product[index].name;
      productpricecontrol.text = product[index].price.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: screen ? Text("Add a Product") : Text("Edit a Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            screen
                ? TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Name/Description"),),
                    controller: productCodecontrol,
                  )
                : TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Name/Description"),),
                    controller: productCodecontrol,
                    readOnly: true,
                  ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Name/Description"),),
              controller: productNamecontrol,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
               decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Price"),),
              controller: productpricecontrol,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  insert();
                  Navigator.pop(context);
                },
                child: screen ? Text("ADD") : Text("EDIT"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
