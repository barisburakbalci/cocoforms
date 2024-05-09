class AuthUserModel {
  final String email;
  final String displayName;
  final String photoURL;

  AuthUserModel({
    required this.email,
    required this.displayName,
    required this.photoURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
    };
  }
}
