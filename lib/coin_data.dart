import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String apiKey = '63BE7554-85B7-45E6-8F30-13B84B49FCAE';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String cryptoValue, String Currency) async {
    var url =
        Uri.https('rest.coinapi.io', '/v1/exchangerate/$cryptoValue/$Currency');
    var response = await http.get(url, headers: {'X-CoinAPI-Key': apiKey});
    if (response.statusCode == 200) {
      var decodedData = convert.jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with request';
    }
  }
}
