import '../models/user_model.dart';

class AuthService {
  // Mock current logged-in user for demonstration
  UserModel? _currentUser = UserModel(
    id: 'user_1',
    username: 'DebateMaster',
    profileImageUrl: 'https://i.pravatar.cc/150?img=12',
    age: 24,
    bio: 'Passionate about politics, tech, and philosophy.',
    totalDebates: 15,
    wins: 10,
  );

  UserModel? get currentUser => _currentUser;

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return true;
  }

  Future<bool> signup(String username, String email, String password, int age) async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      username: username,
      profileImageUrl: 'https://i.pravatar.cc/150?img=33',
      age: age,
      bio: 'New debater ready to speak up!',
    );
    return true;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }
}
