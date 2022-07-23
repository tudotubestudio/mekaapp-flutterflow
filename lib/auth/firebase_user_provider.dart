import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MekAappFirebaseUser {
  MekAappFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MekAappFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MekAappFirebaseUser> mekAappFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MekAappFirebaseUser>(
        (user) => currentUser = MekAappFirebaseUser(user));
