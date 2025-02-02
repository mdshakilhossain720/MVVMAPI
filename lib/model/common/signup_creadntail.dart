class SignupCreadntail {
  String fristName;
  String email;
  String password;
  String confirmPassword;
  String phoneNumber;

  SignupCreadntail({
    required this.fristName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
  });

  SignupCreadntail copyWith({
    String? fristName,
    String? email,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
  }) {
    return SignupCreadntail(
      fristName: fristName ?? this.fristName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': fristName,
      'email': email,
      'phone': phoneNumber,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }
}
