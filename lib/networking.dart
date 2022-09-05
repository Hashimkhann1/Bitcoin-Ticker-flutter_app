import 'dart:convert';
import 'package:http/http.dart' as http;

const apikey = '5F705A98-F89C-4E19-A9CB-C145F24B306C';
const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class NetworkingHelper {

  Future<dynamic> getdata() async {

    const url = '$coinApiUrl/BTC/USD?apikey=$apikey';
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){

      var decodeData = jsonDecode(response.body);
      var lastRate = decodeData['rate'];
      print(lastRate);
      return lastRate;
    }
    else{
      print(response.statusCode);
    }

  }
}










// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//

//
// class CoinModal {
//   Future<dynamic> coinData() async{
//
//     http.Response response = await http.get(Uri.parse(url),);
//     // print(response.body);
//     print(response.body);
//     String data = response.body;
//     return jsonDecode(data);
//   }
// }