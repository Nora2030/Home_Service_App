import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {

        DocumentSnapshot userData = await _firestore.collection("users").doc(user.uid).get();

        if (userData.exists) {

          print("User Data: ${userData.data()}");
        } else {
          print("No user data found.");
        }
      }
    } catch (e) {
      print('Error signing in with email: $e');

    }
  }


  Future<void> registerWithEmail(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {

        await _firestore.collection("users").doc(user.uid).set({
          'username': username,
          'uid': user.uid,
          'email': user.email,
          'phone': user.phoneNumber,
        });
      }
    } catch (e) {
      print('Error registering with email: $e');

    }
  }


  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      if (googleAuth == null) {
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if(user !=null){
        if(userCredential.additionalUserInfo!.isNewUser){
          _firestore.collection("users").doc(user.uid).set({
            'image':user.photoURL,
            'username':user.displayName,
            'uid': user.uid,
            'email':user.email,
            'phone':user.phoneNumber,
          });
        }
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }


  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}