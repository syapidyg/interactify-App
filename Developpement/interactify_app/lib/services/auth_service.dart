

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interactify_app/models/Users.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method for registering a new user
  Future<Users?> register(String username, String promotion, String email, String password) async {
    try {

      
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        Users utilisateur = Users(
          id: user.uid,
          username: username,
          promotion: promotion,
          email: email,
        );

        await _firestore.collection('users').doc(user.uid).set(utilisateur.toJson());
        return utilisateur;
      }
      return null;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  // Method for logging in an existing user
  Future<Users?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
        return Users.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<Users?> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
      return Users.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}
