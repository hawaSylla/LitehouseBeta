import 'package:firebase_auth/firebase_auth.dart';

// creating firebase instance
final FirebaseAuth auth = FirebaseAuth.instance;

signOut() async* {
  await auth.signOut();
}
