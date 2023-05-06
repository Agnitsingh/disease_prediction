import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:disease_symptoms/consts/consts.dart';

class AuthController extends GetxController{
  var isloading = false.obs;

  // Text Controllers

  var emailController = TextEditingController();
  var passwordController = TextEditingController();




  // Login Method

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(email:emailController.text,password:passwordController.text);
    } on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  // SignUp Method
  Future<UserCredential?> signupMethod({email,password,context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(email:email,password:password);
    } on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Storing Data method -- Dynamic
  storeUserData({name,password,email})async{
    DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({'name':name,
      'password':password,
      'email':email,
      'imageUrl':'',
      'id': currentUser!.uid,
    });
  }

  // Sign Out Method

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}