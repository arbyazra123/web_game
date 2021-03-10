// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
    RegisterRequest({
        this.username,
        this.email,
        this.password,
        this.age
    });

    String username;
    String email;
    String password;
    String age;

    RegisterRequest copyWith({
        String username,
        String email,
        String age,
        String password,
    }) => 
        RegisterRequest(
            username: username ?? this.username,
            email: email ?? this.email,
            age: age ?? this.age,
            password: password ?? this.password,
        );

    factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        age: json["age"] == null ? null : json["age"],
    );

    Map<String, String> toJson() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "age": age == null ? null : age,
    };
}
