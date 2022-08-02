import 'dart:convert';

class UserModel {
  String? email;
  String? nome;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;
  UserModel({
    this.email,
    this.nome,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  UserModel copyWith({
    String? email,
    String? nome,
    String? phone,
    String? cpf,
    String? password,
    String? id,
    String? token,
  }) {
    return UserModel(
      email: email ?? this.email,
      nome: nome ?? this.nome,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
      id: id ?? this.id,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullname': nome,
      'phone': phone,
      'cpf': cpf,
      'password': password,
      'id': id,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      nome: map['fullname'],
      phone: map['phone'],
      cpf: map['cpf'],
      password: map['password'],
      id: map['id'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, nome: $nome, phone: $phone, cpf: $cpf, password: $password, id: $id, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.nome == nome &&
        other.phone == phone &&
        other.cpf == cpf &&
        other.password == password &&
        other.id == id &&
        other.token == token;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        nome.hashCode ^
        phone.hashCode ^
        cpf.hashCode ^
        password.hashCode ^
        id.hashCode ^
        token.hashCode;
  }
}
