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
        'picture_url': '',
        'category_id': 'electronics',
        'type': 'electronics',
        'event_date': DateTime.now().toLocal().toIso8601String(),
        'warranty': false,
        'category_descriptor': {
          'passenger': {},
          'route': {},
        }
      };
}
