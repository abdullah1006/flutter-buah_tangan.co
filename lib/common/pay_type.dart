class PayType {
  String method;
  List<String> childMethod;
  PayType({
    required this.method,
    required this.childMethod,
  });
}

List<PayType> payType = [
  PayType(childMethod: ['Kartu Kredit'], method: 'Kartu Kredit'),
  PayType(
    method: 'Transfer Bank',
    childMethod: [
      'Bank A',
      'Bank B',
      'Bank C',
      'Bank D',
    ],
  ),
  PayType(
    method: 'Tunai Di Gerai Retail',
    childMethod: [
      'Alfamart',
      'Indomaret',
      'Kantor Pos',
    ],
  )
];
