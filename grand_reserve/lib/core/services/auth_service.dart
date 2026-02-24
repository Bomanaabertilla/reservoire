import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  static AuthService get instance => _instance;
  AuthService._internal();

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void setUser(UserModel user) {
    _currentUser = user;
  }

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // In a real app, you would send googleAuth.idToken to your backend
      // and get a user object back. For this demo, we'll create a UserModel.
      final user = UserModel(
        id: googleUser.id,
        fullName: googleUser.displayName ?? 'Google User',
        email: googleUser.email,
        memberStatus: 'SILVER MEMBER',
        profileInitials:
            (googleUser.displayName != null &&
                googleUser.displayName!.isNotEmpty)
            ? googleUser.displayName![0].toUpperCase()
            : 'G',
        totalBookings: '0',
        pointsEarned: '0',
        activeTrips: '0',
      );

      _currentUser = user;
      return user;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  Future<UserModel?> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // In a real app, you would send credential to your backend
      final user = UserModel(
        id: credential.userIdentifier ?? 'apple_user',
        fullName:
            '${credential.givenName ?? ""} ${credential.familyName ?? ""}'
                .trim()
                .isNotEmpty
            ? '${credential.givenName ?? ""} ${credential.familyName ?? ""}'
            : 'Apple User',
        email: credential.email ?? 'apple@example.com',
        memberStatus: 'SILVER MEMBER',
        profileInitials:
            (credential.givenName != null && credential.givenName!.isNotEmpty)
            ? credential.givenName![0].toUpperCase()
            : 'A',
        totalBookings: '0',
        pointsEarned: '0',
        activeTrips: '0',
      );

      _currentUser = user;
      return user;
    } catch (e) {
      print('Error signing in with Apple: $e');
      return null;
    }
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
