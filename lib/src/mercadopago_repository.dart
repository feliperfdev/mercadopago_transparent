import 'card/card_repository.dart';
import 'client/client_repository.dart';
import 'payment/payment_repository.dart';
import 'request_repository.dart';
import 'subscriptions/subscriptions_repository.dart';
import 'user_subscription/user_subscription_repository.dart';

final class MercadoPago {
  final String accessToken;
  final String publicKey;
  final String applicationId;

  late final CardRepository card;
  late final ClientRepository client;
  late final PaymentRepository payment;
  late final SubscriptionsRepository subscriptions;
  late final UserSubscriptionRepository userSubscription;

  MercadoPago({
    required this.accessToken,
    required this.publicKey,
    required this.applicationId,
  }) {
    card = CardRepository(accessToken: accessToken, request: Request());
    client = ClientRepository(accessToken: accessToken, request: Request());
    payment = PaymentRepository(accessToken: accessToken, request: Request());
    subscriptions = SubscriptionsRepository(
      accessToken: accessToken,
      request: Request(),
    );
    userSubscription = UserSubscriptionRepository(
      accessToken: accessToken,
      request: Request(),
    );
  }
}
