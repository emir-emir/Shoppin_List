import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/grocery_item.dart';
import 'package:shopping_list/widget/global_textformfield.dart';

import '../model/category.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              nameTextFormField(),
              Row(
                children: [
                  quantityTextFormField,
                  SizedBox(width: 8),
                  categoryDropdownButton
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  resetTextButton,
                  SizedBox(width: 15),
                  addItemElevatedButton
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton get addItemElevatedButton => ElevatedButton(onPressed: _saveItem, child: Text("Öğe Ekle"));

  TextButton get resetTextButton {
    return TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: Text("Sıfırla"));
  }

  Expanded get categoryDropdownButton {
    return Expanded(
                  child: DropdownButtonFormField(
                    value: _selectedCategory,
                    items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ))
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                );
  }

  Expanded get quantityTextFormField {
    return Expanded(
                  child: GlobalTextFormField(
                    initialValue: _enteredQuantity.toString(),
                    selectValidator: false,
                    onSaved: (value) {
                      _enteredQuantity = int.parse(value!);
                    },
                  ),
                );
  }

  GlobalTextFormField nameTextFormField() {
    return GlobalTextFormField(
              onSaved: (value) {
                _enteredName = value!;
              },
            );
  }

  AppBar get appBar {
    return AppBar(
      title: Text("Yeni Bir Öğe Ekle"),
    );
  }
}
