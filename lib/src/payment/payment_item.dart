class PaymentItem {
  final String mlID;
  final String productName;
  final String? productDescription;
  final int quantity;
  final double price;

  PaymentItem({
    required this.mlID,
    required this.productName,
    required this.productDescription,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() => {
        'id': mlID,
        'title': productName,
        'description': productDescription ?? '',
        'quantity': quantity,
        'unit_price': price,
      };
}
