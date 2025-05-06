import 'package:mercadopago_transparent/src/card/card_model.dart';
import 'package:mercadopago_transparent/src/client/client_model.dart';
import 'package:mercadopago_transparent/src/request_repository.dart';

class ClientRepository {
  final Request request;
  late final String accessToken;

  ClientRepository({required this.accessToken, required this.request});

  ///Cria um novo cliente passando um [Client]
  Future<String> create({required Client client}) async {
    try {
      final result = await request.post(
        path: 'v1/customers',
        accessToken: accessToken,
        data: client.toJson(),
      );

      return result['id'];
    } catch (e) {
      return throw e;
    }
  }

  Future<String> delete({required String id}) async {
    try {
      final result = await request.delete(
        path: 'v1/customers/$id',
        accessToken: accessToken,
      );
      return result['id'];
    } catch (e) {
      return throw e;
    }
  }

  ///Salva um cartão tokenizado [token] a um determinado cliente [clientId]
  Future<Card> savecard({
    required String clientId,
    required String token,
  }) async {
    try {
      final result = await request.post(
        path: 'v1/customers/$clientId/cards',
        accessToken: accessToken,
        data: {'token': token},
      );

      return Card.fromJson(result);
    } catch (e) {
      return throw e;
    }
  }

  ///Retorna todos os cartões de um cliente
  Future<List<Card>> getCardsFromClient({required String clientId}) async {
    try {
      final result = await request.get(
        path: 'v1/customers/$clientId/cards',
        accessToken: accessToken,
      );

      return (result as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((cardMap) => Card.fromJson(cardMap))
          .toList();
    } catch (e) {
      return throw e;
    }
  }

  ///Deleta cartão de um cliente
  Future<String> deleteCard({
    required String clientId,
    required String cardId,
  }) async {
    try {
      final result = await request.delete(
        path: 'v1/customers/$clientId/cards/$cardId',
        accessToken: accessToken,
      );

      return result['id'];
    } catch (e) {
      return throw e;
    }
  }

  ///Modificar um cartão já existente
  Future<String> updateCard({
    required String clientId,
    required String cardId,
    required String token,
  }) async {
    try {
      final result = await request.put(
        path: 'v1/customers/$clientId/cards/$cardId',
        accessToken: accessToken,
        data: {'token': token},
      );

      return result['id'];
    } catch (e) {
      return throw e;
    }
  }

  Future<Client?> get({String? email, String? id}) async {
    try {
      String path = "";
      if (email != null) {
        path = 'v1/customers/search?email=$email';
        final result = await request.get(path: path, accessToken: accessToken);
        final client = Client.fromJson(result["results"][0]);
        return client;
      } else if (id != null) {
        path = 'v1/customers/$id';

        final result = Client.fromJson(
          await request.get(path: path, accessToken: accessToken),
        );
        return result;
      }

      return null;
    } catch (e) {
      return throw e;
    }
  }
}
