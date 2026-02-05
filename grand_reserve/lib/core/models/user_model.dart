class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String memberStatus;
  final String profileInitials;
  final String totalBookings;
  final String pointsEarned;
  final String activeTrips;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.memberStatus,
    required this.profileInitials,
    required this.totalBookings,
    required this.pointsEarned,
    required this.activeTrips,
  });
}
