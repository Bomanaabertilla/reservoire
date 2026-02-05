import '../models/user_model.dart';

class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  static AuthService get instance => _instance;
  AuthService._internal();

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  void initializeMockUser() {
    _currentUser = UserModel(
      id: '1',
      fullName: 'Julian Alexander',
      email: 'julian.alexander@example.com',
      memberStatus: 'GOLD MEMBER',
      profileInitials: 'JA',
      totalBookings: '12',
      pointsEarned: '4,850',
      activeTrips: '2',
    );
  }

  // Add methods for login/logout if needed later
  void logout() {
    _currentUser = null;
  }
}
