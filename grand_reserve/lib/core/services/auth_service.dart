import '../models/user_model.dart';

class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  static AuthService get instance => _instance;
  AuthService._internal();

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  void setUser(UserModel user) {
    _currentUser = user;
  }

  void initializeMockUser() {
    _currentUser = UserModel(
      id: '1',
      fullName: 'Julian Alexander',
      email: 'julian.alexander@example.com',
      memberStatus: 'GOLD MEMBER',
      profileInitials: 'JA',
      totalBookings: '0',
      pointsEarned: '0',
      activeTrips: '0',
    );
  }

  // Add methods for login/logout if needed later
  void logout() {
    _currentUser = null;
  }
}
