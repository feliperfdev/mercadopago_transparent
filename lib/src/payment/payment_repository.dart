import 'package:mercadopago_transparent/src/payment/methodspayment_model.dart';
import 'package:mercadopago_transparent/src/payment/payment_model.dart';
import 'package:mercadopago_transparent/src/request_repository.dart';

import 'payment_item.dart';

final class PaymentRepository {
  final Request request;
  final String accessToken;

  PaymentRepository({required this.accessToken, required this.request});

  Future<Payment> get({required String id}) async {
    try {
      final result = await request.get(
        path: "v1/payments/$id",
        accessToken: accessToken,
      );
      final payment = Payment.fromJson(result);

      return payment;
    } catch (e) {
      return throw e;
    }
  }

  ///Retorna os métodos de pagamento disponíveis.
  Future<List<MethodsPayment>> paymentMethods() async {
    try {
      final result = await request.get(
        path: "v1/payment_methods",
        accessToken: accessToken,
      );

      final methods = List<MethodsPayment>.from(
        result.map((metd) => MethodsPayment.fromJson(metd)).toList(),
      );
      return methods;
    } catch (e) {
      return throw e;
    }
  }

  ///Realiza o pagamento através do cartão de crédito.
  ///
  ///Se for passado como parametro [clientId], realiza o pagamento com as informações
  ///do cliente já salvas no mercado pago.
  ///
  ///Caso contrário, é obrigatório o preenchimento de todas as demais informações do cliente
  ///[email], [name], [docNumber].
  Future<Payment> creditCard({
    String? clientId,
    String? idempotencyKey,
    List<PaymentItem>? items,
    required String tokenCard,
    required double amount,
    String? description,
    String? paymentMethodId,
    String? issuer,
    String? name,
    String? email,
    String? docNumber,
  }) async {
    try {
      final result = await request.post(
        path: 'v1/payments',
        accessToken: accessToken,
        data: {
          'transaction_amount': amount,
          'token': tokenCard,
          'description': description,
          'installments': 1,
          'payment_method_id': paymentMethodId,
          'issuer_id': issuer,
          'payer':
              clientId != null
                  ? {'type': "customer", 'id': clientId}
                  : {
                    "email": email,
                    "first_name": name!.split(' ').first,
                    "last_name": name.split(' ').last,
                    "identification": {"type": 'CPF', "number": docNumber},
                  },
          "additional_info": {
            "items": items?.map((item) => item.toMap()).toList() ?? [],
          },
        },
        idempotencyKey: idempotencyKey,
      );

      final payment = Payment.fromJson(result);
      return payment;
    } catch (e) {
      return throw e;
    }
  }

  ///Pagamento em boleto
  Future<Payment> ticket({
    String? description,
    String? clientId,
    String? idempotencyKey,
    required double amount,
    required String name,
    required String email,
    required String docNumber,
  }) async {
    final result = await request.post(
      path: 'v1/payments',
      accessToken: accessToken,
      data: {
        "transaction_amount": amount,
        "description": description ?? "",
        "payment_method_id": 'bolbradesco',
        "payer":
            clientId != null
                ? {'type': "customer", 'id': clientId}
                : {
                  "email": email,
                  "first_name": name.split(' ').first,
                  "last_name": name.split(' ').last,
                  "identification": {"type": 'CPF', "number": docNumber},
                },
      },
      idempotencyKey: idempotencyKey,
    );

    final ticket = Payment.fromJson(result, ticket: true);
    return ticket;
  }

  ///Pagamento através de PIX
  Future<Payment> pix({
    String? description,
    String? clientId,
    String? idempotencyKey,
    List<PaymentItem>? items,
    required double amount,
    required String name,
    required String email,
    required String docNumber,
  }) async {
    final result = await request.post(
      path: 'v1/payments',
      accessToken: accessToken,
      data: {
        "transaction_amount": amount,
        "description": description ?? "",
        "payment_method_id": 'pix',
        "payer":
            clientId != null
                ? {'type': "customer", 'id': clientId}
                : {
                  "email": email,
                  "first_name": name.split(' ').first,
                  "last_name": name.split(' ').last,
                  "identification": {"type": 'CPF', "number": docNumber},
                },
        "additional_info": {
          "items": items?.map((item) => item.toMap()).toList() ?? [],
        },
      },
      idempotencyKey: idempotencyKey,
    );

    final pix = Payment.fromJson(result, pix: true);
    return pix;
  }
}
