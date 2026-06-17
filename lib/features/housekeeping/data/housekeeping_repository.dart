import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class HousekeepingRepository {
  final GraphQLClient _client;

  HousekeepingRepository(this._client);

  Future<List<Query$GetRooms$rooms>> getRooms(String propertyId) async {
    final result = await _client.query$GetRooms(
      Options$Query$GetRooms(
        variables: Variables$Query$GetRooms(propertyId: propertyId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.parsedData?.rooms ?? [];
  }

  Future<bool> updateRoomStatus(String roomId, Enum$HousekeepingStatus status) async {
    final result = await _client.mutate$UpdateRoomStatus(
      Options$Mutation$UpdateRoomStatus(
        variables: Variables$Mutation$UpdateRoomStatus(
          id: roomId,
          status: status,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.parsedData?.updateRoomStatus != null;
  }

  Future<bool> togglePriorityCleaning(String roomId, bool priority) async {
    final result = await _client.mutate$UpdateRoom(
      Options$Mutation$UpdateRoom(
        variables: Variables$Mutation$UpdateRoom(
          id: roomId,
          input: Input$UpdateRoomInput(
            priorityCleaning: priority,
          ),
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.parsedData?.updateRoom != null;
  }
}
