import '../request_repository.dart';
import 'user_subscription.dart';

class UserSubscriptionRepository {
  final String accessToken;
  final Request request;

  UserSubscriptionRepository({
    required this.accessToken,
    required this.request,
  });

  Future<UserSubscription> subscribeNewUserToPlan({
    String? planID,
    String? reason,
    String? externalReference,
    required String payerEmail,
    required String cardTokenID,
    required int frequency,
    required String frequencyType,
    String? startDate,
    String? endDate,
    double? amount,
    String currencyID = 'BRL',
    String? status,
  }) async {
    final data = {
      "preapproval_plan_id": planID,
      "reason": reason,
      "external_reference": externalReference,
      "payer_email": payerEmail,
      "card_token_id": cardTokenID,
      "auto_recurring": {
        "frequency": frequency,
        "frequency_type": frequencyType,
        "start_date": startDate,
        "end_date": endDate,
        "transaction_amount": amount,
        "currency_id": currencyID,
      },
      "back_url": "https://www.mercadopago.com.ar",
      "status": status,
    };

    final result = await request.post(
      path: 'preapproval',
      accessToken: accessToken,
      data: data,
    );

    return UserSubscription.fromJson(result);
  }

  Future<UserSubscription> getUserSubscription({
    required String subscriptionId,
  }) async {
    final response = await request.get(
      path: 'preapproval/$subscriptionId',
      accessToken: accessToken,
    );

    return UserSubscription.fromJson(response);
  }

  Future<UserSubscription> updateUserSubscription({
    required String subscriptionId,
    String? reason,
    String? externalReference,
    String? backUrl,
    double? transactionAmount,
    String? currencyId = 'BRL',
  }) async {
    final response = await request.put(
      path: 'preapproval/$subscriptionId',
      accessToken: accessToken,
      data: {
        'id': subscriptionId,
        'reason': reason,
        'external_reference': externalReference,
        'back_url': backUrl,
        'auto_recurring': {
          'transaction_amount': transactionAmount,
          'currency_id': currencyId,
        },
      },
    );

    return UserSubscription.fromJson(response);
  }
}
