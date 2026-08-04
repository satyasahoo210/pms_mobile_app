import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/graphql/graphql_client.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class BookingsRepository {
  final GraphQLClient _client;

  BookingsRepository(this._client);

  Future<List<Query$GetGuests$guests>> getGuests() async {
    final result = await _client.query$GetGuests(
      Options$Query$GetGuests(
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.parsedData?.guests ?? [];
  }

  Future<Mutation$CreateGuest$createGuest> createGuest(Input$CreateGuestInput input) async {
    final result = await _client.mutate$CreateGuest(
      Options$Mutation$CreateGuest(
        variables: Variables$Mutation$CreateGuest(input: input),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.parsedData?.createGuest;
    if (data == null) {
      throw Exception('Failed to create guest');
    }
    return data;
  }

  Future<Mutation$CreateBooking$createBooking> createBooking(Input$CreateBookingInput input) async {
    final result = await _client.mutate$CreateBooking(
      Options$Mutation$CreateBooking(
        variables: Variables$Mutation$CreateBooking(input: input),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.parsedData?.createBooking;
    if (data == null) {
      throw Exception('Failed to create booking');
    }
    return data;
  }

  Future<Mutation$UpdateBooking$updateBooking> updateBooking(String id, Input$UpdateBookingInput input) async {
    final result = await _client.mutate$UpdateBooking(
      Options$Mutation$UpdateBooking(
        variables: Variables$Mutation$UpdateBooking(id: id, input: input),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.parsedData?.updateBooking;
    if (data == null) {
      throw Exception('Failed to update booking');
    }
    return data;
  }
}

final bookingsRepositoryProvider = Provider<BookingsRepository>((ref) {
  final graphqlClient = ref.watch(graphqlClientProvider);
  return BookingsRepository(graphqlClient);
});
