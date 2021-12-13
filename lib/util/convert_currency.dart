import 'package:intl/intl.dart';

class ConvertCurrency {
  //Note : Konversi Int 30000 menjadi String Rp. 30.000
  static String rpFormating(int value) {
    final rpFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return rpFormat.format(value);
  }
}
