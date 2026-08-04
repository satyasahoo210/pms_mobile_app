import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/utils/logger.dart';
import 'package:pms_admin/features/bookings/data/bookings_repository.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/calendar/presentation/calendar_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

final guestsProvider = FutureProvider.autoDispose<List<Query$GetGuests$guests>>(
  (ref) async {
    final repository = ref.watch(bookingsRepositoryProvider);
    return repository.getGuests();
  },
);

class BookingsController extends StateNotifier<AsyncValue<void>> {
  final BookingsRepository _repository;
  final Ref _ref;

  BookingsController(this._repository, this._ref)
    : super(const AsyncValue.data(null));

  Future<Mutation$CreateGuest$createGuest?> createGuest(
    Input$CreateGuestInput input,
  ) async {
    appLog(
      '[BookingsController] createGuest started. Name: ${input.name}, Phone: ${input.phone}',
    );
    state = const AsyncValue.loading();
    try {
      final guest = await _repository.createGuest(input);
      appLog(
        '[BookingsController] createGuest succeeded. Guest ID: ${guest.id}',
      );
      state = const AsyncValue.data(null);
      _ref.invalidate(guestsProvider);
      return guest;
    } catch (e, stack) {
      appLog('[BookingsController] createGuest failed: $e');
      state = AsyncValue.error(e, stack);
      return null;
    }
  }

  Future<bool> createBooking(Input$CreateBookingInput input) async {
    appLog(
      '[BookingsController] createBooking started. Guest: ${input.guestId}, Property: ${input.propertyId}',
    );
    state = const AsyncValue.loading();
    try {
      await _repository.createBooking(input);
      appLog('[BookingsController] createBooking succeeded.');
      state = const AsyncValue.data(null);
      _ref.invalidate(dashboardStatsProvider);
      _ref.invalidate(upcomingArrivalsProvider);
      _ref.invalidate(recentActivityProvider);
      _ref.invalidate(calendarDataProvider);
      return true;
    } catch (e, stack) {
      appLog('[BookingsController] createBooking failed: $e');
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  Future<bool> updateBooking(String id, Input$UpdateBookingInput input) async {
    appLog(
      '[BookingsController] updateBooking started. ID: $id, Status: ${input.status}',
    );
    state = const AsyncValue.loading();
    try {
      await _repository.updateBooking(id, input);
      appLog('[BookingsController] updateBooking succeeded.');
      state = const AsyncValue.data(null);
      _ref.invalidate(dashboardStatsProvider);
      _ref.invalidate(upcomingArrivalsProvider);
      _ref.invalidate(recentActivityProvider);
      _ref.invalidate(calendarDataProvider);
      return true;
    } catch (e, stack) {
      appLog('[BookingsController] updateBooking failed: $e');
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  Future<bool> cancelBooking(String id) async {
    appLog('[BookingsController] cancelBooking started. ID: $id');
    state = const AsyncValue.loading();
    try {
      await _repository.cancelBooking(id);
      appLog('[BookingsController] cancelBooking succeeded.');
      state = const AsyncValue.data(null);
      _ref.invalidate(dashboardStatsProvider);
      _ref.invalidate(upcomingArrivalsProvider);
      _ref.invalidate(recentActivityProvider);
      _ref.invalidate(calendarDataProvider);
      return true;
    } catch (e, stack) {
      appLog('[BookingsController] cancelBooking failed: $e');
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  Future<bool> createPayment(Input$CreatePaymentInput input) async {
    appLog(
      '[BookingsController] createPayment started. Booking: ${input.bookingId}, Amount: ${input.amount}',
    );
    state = const AsyncValue.loading();
    try {
      await _repository.createPayment(input);
      appLog('[BookingsController] createPayment succeeded.');
      state = const AsyncValue.data(null);
      _ref.invalidate(dashboardStatsProvider);
      _ref.invalidate(upcomingArrivalsProvider);
      _ref.invalidate(recentActivityProvider);
      _ref.invalidate(calendarDataProvider);
      return true;
    } catch (e, stack) {
      appLog('[BookingsController] createPayment failed: $e');
      state = AsyncValue.error(e, stack);
      return false;
    }
  }
}

final bookingsControllerProvider =
    StateNotifierProvider.autoDispose<BookingsController, AsyncValue<void>>((
      ref,
    ) {
      final repository = ref.watch(bookingsRepositoryProvider);
      return BookingsController(repository, ref);
    });
