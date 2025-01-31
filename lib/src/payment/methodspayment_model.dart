import 'constants/methodspayment_constants.dart';

class MethodsPayment {
  String? id;
  String? name;
  String? paymentTypeId;
  String? status;
  String? image;
  int? cardNumberLength;
  int? securityCodeLength;
  double? maxAllowedAmount;
  int? accreditationTime;

  MethodsPayment({
    this.id,
    this.name,
    this.paymentTypeId,
    this.status,
    this.image,
    this.cardNumberLength,
    this.securityCodeLength,
    this.maxAllowedAmount,
    this.accreditationTime,
  });

  factory MethodsPayment.fromJson(Map<String, dynamic> json) => MethodsPayment(
        id: json[MethodsPaymentConstants.id],
        name: json[MethodsPaymentConstants.name],
        paymentTypeId: json[MethodsPaymentConstants.paymentTypeId],
        status: json[MethodsPaymentConstants.status],
        image: json[MethodsPaymentConstants.thumbnail],
        maxAllowedAmount:
            ((json[MethodsPaymentConstants.maxAllowedAmount] ?? 0) as num)
                .toDouble(),
        accreditationTime:
            ((json[MethodsPaymentConstants.accreditationTime] ?? 0) as num)
                .toInt(),
        cardNumberLength: json[MethodsPaymentConstants.settings].length > 0
            ? json[MethodsPaymentConstants.settings][0]
                    [MethodsPaymentConstants.cardNumber]
                [MethodsPaymentConstants.length]
            : 0,
        securityCodeLength: json[MethodsPaymentConstants.settings].length > 0
            ? json[MethodsPaymentConstants.settings][0]
                    [MethodsPaymentConstants.securityCode]
                [MethodsPaymentConstants.length]
            : 1,
      );

  Map<String, dynamic> toJson() => {
        MethodsPaymentConstants.id: id,
        MethodsPaymentConstants.name: name,
        MethodsPaymentConstants.paymentTypeId: paymentTypeId,
        MethodsPaymentConstants.status: status,
        MethodsPaymentConstants.thumbnail: image,
        MethodsPaymentConstants.maxAllowedAmount: maxAllowedAmount,
        MethodsPaymentConstants.accreditationTime: accreditationTime,
        MethodsPaymentConstants.cardNumberLength: cardNumberLength,
        MethodsPaymentConstants.securityCodeLength: securityCodeLength
      };
}
