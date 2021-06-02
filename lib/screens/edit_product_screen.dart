import 'package:flutter/material.dart';
import 'package:makemywebsite_shop/provider/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  // final _priceFocusNode = FocusNode();
  // final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();                       //day20 SubmitForm
  var _editedProduct = Product(                               //day20 SubmitForm
    id: null, 
    title: '', 
    desc: '', 
    price: 0, 
    imageUrl: '',
  );

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // _priceFocusNode.dispose();
    // _descriptionFocusNode.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [                                            //day20 SubmitForm
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,                                         //day20 SubmitForm
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                // onFieldSubmitted: (_) {FocusScope.of(context).requestFocus(_priceFocusNode);},
                validator: (value) {                     //validation part day20
                  if(value.isEmpty){
                    return 'Please provide a value'; 
                  }
                  return null;
                },
                onSaved: (newValue) {                         //day20 SubmitForm
                  _editedProduct = Product(
                    title: newValue,
                    price: _editedProduct.price,
                    desc: _editedProduct.desc,
                    imageUrl: _editedProduct.imageUrl,
                    id: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                // focusNode: _priceFocusNode,
                // onFieldSubmitted: (_) {FocusScope.of(context).requestFocus(_descriptionFocusNode);},
                validator: (value) {                     //validation part day20
                  if (value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero';
                  }
                  return null;
                },
                onSaved: (newValue) {                         //day20 SubmitForm
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: double.parse(newValue),
                    desc: _editedProduct.desc,
                    imageUrl: _editedProduct.imageUrl,
                    id: null,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                // focusNode: _descriptionFocusNode,
                validator: (value) {                     //validation part day20
                  if (value.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (value.length < 10){
                    return 'Should be atleast 10 character long';
                  }
                  return null;
                },
                onSaved: (newValue) {                         //day20 SubmitForm
                  _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    desc: newValue,
                    imageUrl: _editedProduct.imageUrl,
                    id: null,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 20, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image Url'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      validator: (value) {               //validation part day20
                        if(value.isEmpty) {
                          return 'Please enter a image URL.';
                        }
                        if(!value.startsWith('http') && !value.startsWith('https')) {
                          return 'Please enter  a valid URL.';
                        }
                        // if(!value.endsWith('.jpg') && !value.endsWith('.png') && !value.endsWith('.jpeg')){
                        //   return 'Please enter a valid image URL';
                        // }
                        return null;
                      },
                      onSaved: (newValue) {                   //day20 SubmitForm
                        _editedProduct = Product(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          desc: _editedProduct.desc,
                          imageUrl: newValue,
                          id: null,
                        );
                      },
                      onFieldSubmitted: (value) {             //day20 SubmitForm
                        _saveForm();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(                                       //day20 SubmitForm
                height: 40,
              ), 
              ElevatedButton(                                 //day20 SubmitForm
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Submit Form',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  _saveForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //day20 SubmitForm
  void _saveForm() {
    final isValid = _form.currentState.validate();       //validation part day20 
    if (!isValid) {                                      //validation part day20
      return;   
    }
    _form.currentState.save();
    print(_editedProduct.title);
    print(_editedProduct.price);
    print(_editedProduct.desc);
    print(_editedProduct.imageUrl);
  }
}
