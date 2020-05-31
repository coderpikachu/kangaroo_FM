import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

var message;
// fire this when Phone verification is completed
final PhoneVerificationCompleted verificationCompleted =
    (AuthCredential phoneAuthCredential) {
  auth.signInWithCredential(phoneAuthCredential);

  message = 'Received phone auth credential: $phoneAuthCredential';
  print(message);
};

// fire this when Phone verification fails
final PhoneVerificationFailed verificationFailed =
    (AuthException authException) {
  message =
      'Phone verification failed. Code: ${authException.code}. Message: ${authException.message}';
  print(message);
};

// fire this when SMS code is sent is sent.
final PhoneCodeSent codeSent =
    (String verificationId, [int forceResendingToken]) async {
  verificationId = verificationId;
  print('Sent verification code');
};

// fire this when smsCode expires
final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
    (String verificationId) {
  verificationId = verificationId;
  print('Auto retrival time-out');
};

// verify phone number
verifyPhoneNumber(String phoneNumber) {
  auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  print('Verification Initiated');
}

// sign in with phone.
signInWithPhoneNumber(String smsCode, String verificationId) async {
  final AuthCredential credential = PhoneAuthProvider.getCredential(
    verificationId: verificationId,
    smsCode: smsCode,
  );

  final FirebaseUser user = (await auth.signInWithCredential(credential)).user;
  final FirebaseUser currentUser = await auth.currentUser();

  assert(user.uid == currentUser.uid);

  if (user != null) {
    message = 'Successfully signed in, uid: ' + user.uid;
  } else {
    message = 'Sign in failed';
  }
}
