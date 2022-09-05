import 'dart:ffi';
import 'package:flutter/cupertino.dart'; //package
import 'package:flutter/material.dart'; //package
import 'networking.dart'; //file
import 'coin_data.dart'; //file
import 'dart:io' show Platform;



class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  NetworkingHelper networkingHelper = NetworkingHelper();

  String? selectedCurency = 'USD';
  DropdownButton<String> andriodDropDown() {

    List<DropdownMenuItem<String>> dropdownItems = [];
    for(String currency in currenciesList){
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(value: selectedCurency,items: dropdownItems,
      onChanged: (value){
      setState(() {
      selectedCurency = value;
    });
  });
  }

  // Widget? getPicker() {
  //   if(Platform.isIOS){
  //     return iosPicker();
  //   }
  //   else if(Platform.isAndroid){
  //     return andriodDropDown();
  //   }
  // }

  CupertinoPicker iosPicker(){

    List<Text> pickerItems = [];
    for(String currency in currenciesList){
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(itemExtent: 32.0, onSelectedItemChanged: (selectedIndex) {
      print(selectedIndex);
      var coinRate = networkingHelper.getdata();
      print('>>>>>>>>   $coinRate');
    }, children:  pickerItems);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : andriodDropDown(),
          )
        ],
      ),
    );
  }
}