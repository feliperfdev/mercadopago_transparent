import 'auto_recurring.dart';
import 'summarized_user_subscription.dart';

final class UserSubscription {
  final String? id;
  final String? preapprovalPlanId;
  final String? reason;
  final int? externalReference;
  final String? backUrl;
  final AutoRecurring? autoRecurring;
  final int? payerId;
  final int? cardId;
  final int? paymentMethodId;
  final String? nextPaymentDate;
  final String? dateCreated;
  final String? lastModified;
  final String? status;
  final SummarizedUserSubscription? summarized;

  UserSubscription({
    this.id,
    this.preapprovalPlanId,
    this.reason,
    this.externalReference,
    this.backUrl,
    this.autoRecurring,
    this.payerId,
    this.cardId,
    this.paymentMethodId,
    this.nextPaymentDate,
    this.dateCreated,
    this.lastModified,
    this.status,
    this.summarized,
  });

  factory UserSubscription.fromJson(Map<String, dynamic> json) =>
      UserSubscription(
        id: json['id'],
        preapprovalPlanId: json['preapproval_plan_id'],
        reason: json['reason'],
        externalReference: json['external_reference'],
        backUrl: json['back_url'],
        autoRecurring:
            json['auto_recurring'] != null
                ? AutoRecurring.fromJson(json['auto_recurring'])
                : null,
        payerId: json['payer_id'],
        cardId: json['card_id'],
        paymentMethodId: json['payment_method_id'],
        nextPaymentDate: json['next_payment_date'],
        dateCreated: json['date_created'],
        lastModified: json['last_modified'],
        status: json['status'],
        summarized:
            json['summarized'] != null
                ? SummarizedUserSubscription.fromJson(json['summarized'])
                : null,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'preapproval_plan_id': preapprovalPlanId,
    'reason': reason,
    'external_reference': externalReference,
    'back_url': backUrl,
    'auto_recurring': autoRecurring?.toJson(),
    'payer_id': payerId,
    'card_id': cardId,
    'payment_method_id': paymentMethodId,
    'next_payment_date': nextPaymentDate,
    'date_created': dateCreated,
    'last_modified': lastModified,
    'status': status,
    'summarized': summarized?.toJson(),
  };
}
