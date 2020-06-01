import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/cart/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:flutter_bonapp/widgets/cart/items.dart';

class CartMobilePortrait extends BaseModelWidget<CartViewModel> {
  @override
  Widget build(BuildContext context, CartViewModel data) {
    print(data.itemCount);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        height: 35.0,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => print('Alert Bar'),
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
              Container(
                height: 400.0,
                child: Column(
                  children: <Widget>[
                    Text('ADD'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.items.length,
                        itemBuilder: (ctx, i) => CartItems(
                            data.items.values.toList()[i].id.toString(),
                            data.items.keys.toList()[i],
                            data.items.values.toList()[i].price,
                            data.items.values.toList()[i].quantity,
                            data.items.values.toList()[i].name),
                      ),
                    ),
                    FlatButton(
                        onPressed: () => print('CHECKOUT'),
                        child: Text(
                          'Checkout',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartMobileLandscape extends BaseModelWidget<CartViewModel> {
  @override
  Widget build(BuildContext context, CartViewModel data) {
    return Container(
      child: Text('Cart Page.'),
    );
  }
}
