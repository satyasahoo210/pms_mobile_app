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

  Future<Mutation$CancelBooking$cancelBooking> cancelBooking(String id) async {
    final result = await _client.mutate$CancelBooking(
      Options$Mutation$CancelBooking(
        variables: Variables$Mutation$CancelBooking(id: id),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.parsedData?.cancelBooking;
    if (data == null) {
      throw Exception('Failed to cancel booking');
    }
    return data;
  }

  Future<Mutation$CreatePayment$createPayment> createPayment(Input$CreatePaymentInput input) async {
    final result = await _client.mutate$CreatePayment(
      Options$Mutation$CreatePayment(
        variables: Variables$Mutation$CreatePayment(input: input),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.parsedData?.createPayment;
    if (data == null) {
      throw Exception('Failed to create payment');
    }
    return data;
  }

  Future<List<Query$GetServices$services>> getServices(String propertyId) async {
    final result = await _client.query$GetServices(
      Options$Query$GetServices(
        variables: Variables$Query$GetServices(propertyId: propertyId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result.parsedData?.services ?? [];
  }

  Future<Mutation$AddBookingRoom$addBookingRoom> addBookingRoom({
    required String bookingId,
    String? roomId,
    required String roomTypeId,
    String? checkInDate,
    String? checkOutDate,
  }) async {
    final result = await _client.mutate$AddBookingRoom(
      Options$Mutation$AddBookingRoom(
        variables: Variables$Mutation$AddBookingRoom(
          bookingId: bookingId,
          roomId: roomId,
          roomTypeId: roomTypeId,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
        ),
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    final data = result.parsedData?.addBookingRoom;
    if (data == null) {
      throw Exception('Failed to add room to booking');
    }
    return data;
  }

  Future<Mutation$UpdateBookingRoom$updateBookingRoom> updateBookingRoom(
    String id,
    Input$UpdateBookingRoomInput input,
  ) async {
    final result = await _client.mutate$UpdateBookingRoom(
      Options$Mutation$UpdateBookingRoom(
        variables: Variables$Mutation$UpdateBookingRoom(id: id, input: input),
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    final data = result.parsedData?.updateBookingRoom;
    if (data == null) {
      throw Exception('Failed to update booking room');
    }
    return data;
  }

  Future<bool> deleteBookingRoom(String id) async {
    final result = await _client.mutate$DeleteBookingRoom(
      Options$Mutation$DeleteBookingRoom(
        variables: Variables$Mutation$DeleteBookingRoom(id: id),
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result.parsedData?.deleteBookingRoom ?? false;
  }

  Future<Mutation$AddBookingService$addBookingService> addBookingService({
    required String bookingId,
    required String serviceId,
    required int quantity,
    required double totalPrice,
  }) async {
    final result = await _client.mutate$AddBookingService(
      Options$Mutation$AddBookingService(
        variables: Variables$Mutation$AddBookingService(
          bookingId: bookingId,
          serviceId: serviceId,
          quantity: quantity,
          totalPrice: totalPrice,
        ),
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    final data = result.parsedData?.addBookingService;
    if (data == null) {
      throw Exception('Failed to add service to booking');
    }
    return data;
  }

  Future<Mutation$UpdateBookingService$updateBookingService> updateBookingService(
    String id,
    Input$UpdateBookingServiceInput input,
  ) async {
    final result = await _client.mutate$UpdateBookingService(
      Options$Mutation$UpdateBookingService(
        variables: Variables$Mutation$UpdateBookingService(id: id, input: input),
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    final data = result.parsedData?.updateBookingService;
    if (data == null) {
      throw Exception('Failed to update booking service');
    }
    return data;
  }

  Future<bool> deleteBookingService(String id) async {
    final result = await _client.mutate$DeleteBookingService(
      Options$Mutation$DeleteBookingService(
        variables: Variables$Mutation$DeleteBookingService(id: id),
      ),
    );
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result.parsedData?.deleteBookingService ?? false;
  }
}

final bookingsRepositoryProvider = Provider<BookingsRepository>((ref) {
  final graphqlClient = ref.watch(graphqlClientProvider);
  return BookingsRepository(graphqlClient);
});
