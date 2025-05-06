final class SummarizedUserSubscription {
  final int? quotas;
  final int? chargedQuantity;
  final int? chargedAmount;
  final int? pendingChargeQuantity;
  final int? pendingChargeAmount;
  final String? lastChargedDate;
  final int? lastChargedAmount;
  final String? semaphore;

  SummarizedUserSubscription({
    this.quotas,
    this.chargedQuantity,
    this.chargedAmount,
    this.pendingChargeQuantity,
    this.pendingChargeAmount,
    this.lastChargedDate,
    this.lastChargedAmount,
    this.semaphore,
  });

  factory SummarizedUserSubscription.fromJson(Map<String, dynamic> json) =>
      SummarizedUserSubscription(
        quotas: json['quotas'],
        chargedQuantity: json['charged_quantity'],
        chargedAmount: json['charged_amount'],
        pendingChargeQuantity: json['pending_charge_quantity'],
        pendingChargeAmount: json['pending_charge_amount'],
        lastChargedDate: json['last_charged_date'],
        lastChargedAmount: json['last_charged_amount'],
        semaphore: json['semaphore'],
      );

  Map<String, dynamic> toJson() => {
    'quotas': quotas,
    'charged_quantity': chargedQuantity,
    'charged_amount': chargedAmount,
    'pending_charge_quantity': pendingChargeQuantity,
    'pending_charge_amount': pendingChargeAmount,
    'last_charged_date': lastChargedDate,
    'last_charged_amount': lastChargedAmount,
    'semaphore': semaphore,
  };
}
