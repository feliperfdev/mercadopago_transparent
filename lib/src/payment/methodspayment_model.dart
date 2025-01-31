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
        id: json["id"],
        name: json["name"],
        paymentTypeId: json["payment_type_id"],
        status: json["status"],
        image: json["thumbnail"],
        maxAllowedAmount: json["max_allowed_amount"],
        accreditationTime: json["accreditation_time"],
        cardNumberLength: json["settings"].length > 0
            ? json["settings"][0]["card_number"]["length"]
            : 0,
        securityCodeLength: json["settings"].length > 0
            ? json["settings"][0]["security_code"]["length"]
            : 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "payment_type_id": paymentTypeId,
        "status": status,
        "thumbnail": image,
        "max_allowed_amount": maxAllowedAmount,
        "accreditation_time": accreditationTime,
        "cardNumberLength": cardNumberLength,
        "securityCodeLength": securityCodeLength
      };
}
