import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/models/itemModel.dart';


import 'main.dart';


class ItemDetail extends StatefulWidget {
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  GlobalKey<AutoCompleteTextFieldState<ItemModel>> key = new GlobalKey();

  AutoCompleteTextField searchTextField;

  TextEditingController controller = new TextEditingController();

  _ItemDetailState();

  void _loadData() async {
    await ItemViewModel.loadItems();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Shop Item'),
          backgroundColor: Colors.green,
          actions: <Widget>[
        IconButton(
          tooltip: 'Logout',
        icon: Icon(
          Icons.backspace,
          color: Colors.white,
        ),
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.clear();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => MyApp()));
      },
        )
          ],
        ),
        body: new Center(
            child: new Column(children: <Widget>[
              new Column(children: <Widget>[
                searchTextField = AutoCompleteTextField<ItemModel>(
                    style: new TextStyle(color: Colors.black, fontSize: 16.0),
                    decoration: new InputDecoration(
                        suffixIcon: Container(
                          width: 85.0,
                          height: 60.0,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                        filled: true,
                        hintText: 'Search Item Name By Category',
                        hintStyle: TextStyle(color: Colors.black)),
                    itemSubmitted: (item) {
                      setState(() => searchTextField.textField.controller.text =
                          item.englishName);
                    },
                    clearOnSubmit: false,
                    key: key,
                    suggestions: ItemViewModel.items,
                    itemBuilder: (context, item) {
                      return Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(item.categories,
                            style: TextStyle(
                                fontSize: 16.0
                            ),),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          Text(item.englishName,
                          ),
                          Text(item.price)
                        ],
                      ));
                    },
                    itemSorter: (a, b) {
                      return a.categories.compareTo(b.categories);
                    },
                    itemFilter: (item, query) {
                      return item.categories
                          .toLowerCase()
                          .startsWith(query.toLowerCase());
                    }),
              ]),
            ])));
  }
}
