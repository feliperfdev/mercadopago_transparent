final class AutoRecurring {
  final int? frequency;
  final String? frequencyType;
  final String? startDate;
  final String? endDate;
  final String? currencyId;
  final int? transactionAmount;
  final FreeTrial? freeTrial;

  AutoRecurring({
    this.frequency,
    this.frequencyType,
    this.startDate,
    this.endDate,
    this.currencyId,
    this.transactionAmount,
    this.freeTrial,
  });

  factory AutoRecurring.fromJson(Map<String, dynamic> json) => AutoRecurring(
    frequency: json['frequency'],
    frequencyType: json['frequency_type'],
    startDate: json['start_date'],
    endDate: json['end_date'],
    currencyId: json['currency_id'],
    transactionAmount: json['transaction_amount'],
    freeTrial:
        json['free_trial'] != null
            ? FreeTrial.fromJson(json['free_trial'])
            : null,
  );

  Map<String, dynamic> toJson() => {
    'frequency': frequency,
    'frequency_type': frequencyType,
    'start_date': startDate,
    'end_date': endDate,
    'currency_id': currencyId,
    'transaction_amount': transactionAmount,
    'free_trial': freeTrial?.toJson(),
  };
}

final class FreeTrial {
  final int? frequency;
  final String? frequencyType;

  FreeTrial({this.frequency, this.frequencyType});

  factory FreeTrial.fromJson(Map<String, dynamic> json) => FreeTrial(
    frequency: json['frequency'],
    frequencyType: json['frequency_type'],
  );

  Map<String, dynamic> toJson() => {
    'frequency': frequency,
    'frequency_type': frequencyType,
  };
}
