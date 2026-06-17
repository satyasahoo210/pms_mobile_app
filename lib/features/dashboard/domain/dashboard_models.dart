class DashboardStats {
  final int occupiedRooms;
  final int availableRooms;
  final int dirtyRooms;
  final int maintenanceRooms;
  final int totalRooms;
  final double occupancyPercentage;
  final int arrivalsToday;
  final int departuresToday;
  final int pendingPayments;
  final double revenueSummary;
  final int staffCount;

  DashboardStats({
    required this.occupiedRooms,
    required this.availableRooms,
    required this.dirtyRooms,
    required this.maintenanceRooms,
    required this.totalRooms,
    required this.occupancyPercentage,
    required this.arrivalsToday,
    required this.departuresToday,
    required this.pendingPayments,
    required this.revenueSummary,
    required this.staffCount,
  });

  factory DashboardStats.empty() {
    return DashboardStats(
      occupiedRooms: 0,
      availableRooms: 0,
      dirtyRooms: 0,
      maintenanceRooms: 0,
      totalRooms: 0,
      occupancyPercentage: 0.0,
      arrivalsToday: 0,
      departuresToday: 0,
      pendingPayments: 0,
      revenueSummary: 0.0,
      staffCount: 0,
    );
  }
}

class ArrivalInfo {
  final String guestName;
  final String roomNumber;
  final String roomType;
  final String eta;
  final bool isPrepaid;

  ArrivalInfo({
    required this.guestName,
    required this.roomNumber,
    required this.roomType,
    required this.eta,
    required this.isPrepaid,
  });
}

class ActivityItem {
  final String id;
  final String title;
  final String timeAgo;
  final String staffName;
  final String type; // 'clean', 'dirty', 'maintenance', 'payment', 'checkin'

  ActivityItem({
    required this.id,
    required this.title,
    required this.timeAgo,
    required this.staffName,
    required this.type,
  });
}
