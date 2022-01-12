import 'dart:convert';

class User {
  final String uid;
  final String? email;

  User(
    this.uid,
    this.email,
  );

  User copyWith({
    String? uid,
    String? email,
  }) {
    return User(
      uid ?? this.uid,
      email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['uid'] ?? '',
      map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(uid: $uid, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;
}
