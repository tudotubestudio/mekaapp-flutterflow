import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MekaappFirebaseUser {
  MekaappFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MekaappFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MekaappFirebaseUser> mekaappFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MekaappFirebaseUser>(
      (user) {
        currentUser = MekaappFirebaseUser(user);
        return currentUser!;
      },
    );
