// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    List<UserElement> users;
    int total;
    int skip;
    int limit;

    User({
        required this.users,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        users: List<UserElement>.from(json["users"].map((x) => UserElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class UserElement {
    int id;
    String firstName;
    String lastName;
    String maidenName;
    int age;
    String gender;
    String email;
    String phone;
    String username;
    String password;
    String birthDate;
    String image;
    String bloodGroup;
    double height;
    double weight;
    String eyeColor;
    Hair hair;
    String ip;
    Address address;
    String macAddress;
    String university;
    Bank bank;
    Company company;
    String ein;
    String ssn;
    String userAgent;
    Crypto crypto;
    String role;

    UserElement({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.maidenName,
        required this.age,
        required this.gender,
        required this.email,
        required this.phone,
        required this.username,
        required this.password,
        required this.birthDate,
        required this.image,
        required this.bloodGroup,
        required this.height,
        required this.weight,
        required this.eyeColor,
        required this.hair,
        required this.ip,
        required this.address,
        required this.macAddress,
        required this.university,
        required this.bank,
        required this.company,
        required this.ein,
        required this.ssn,
        required this.userAgent,
        required this.crypto,
        required this.role,
    });

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        birthDate: json["birthDate"],
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        eyeColor: json["eyeColor"],
        hair: Hair.fromJson(json["hair"]),
        ip: json["ip"],
        address: Address.fromJson(json["address"]),
        macAddress: json["macAddress"],
        university: json["university"],
        bank: Bank.fromJson(json["bank"]),
        company: Company.fromJson(json["company"]),
        ein: json["ein"],
        ssn: json["ssn"],
        userAgent: json["userAgent"],
        crypto: Crypto.fromJson(json["crypto"]),
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate": birthDate,
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hair": hair.toJson(),
        "ip": ip,
        "address": address.toJson(),
        "macAddress": macAddress,
        "university": university,
        "bank": bank.toJson(),
        "company": company.toJson(),
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
        "crypto": crypto.toJson(),
        "role": role,
    };
}

class Address {
    String address;
    String city;
    String state;
    String stateCode;
    String postalCode;
    Coordinates coordinates;
    String country;

    Address({
        required this.address,
        required this.city,
        required this.state,
        required this.stateCode,
        required this.postalCode,
        required this.coordinates,
        required this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        stateCode: json["stateCode"],
        postalCode: json["postalCode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "state": state,
        "stateCode": stateCode,
        "postalCode": postalCode,
        "coordinates": coordinates.toJson(),
        "country": country,
    };
}

class Coordinates {
    double lat;
    double lng;

    Coordinates({
        required this.lat,
        required this.lng,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Bank {
    String cardExpire;
    String cardNumber;
    String cardType;
    String currency;
    String iban;

    Bank({
        required this.cardExpire,
        required this.cardNumber,
        required this.cardType,
        required this.currency,
        required this.iban,
    });

    factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
    );

    Map<String, dynamic> toJson() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
    };
}

class Company {
    String department;
    String name;
    String title;
    Address address;

    Company({
        required this.department,
        required this.name,
        required this.title,
        required this.address,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        department: json["department"],
        name: json["name"],
        title: json["title"],
        address: Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "department": department,
        "name": name,
        "title": title,
        "address": address.toJson(),
    };
}

class Crypto {
    String coin;
    String wallet;
    String network;

    Crypto({
        required this.coin,
        required this.wallet,
        required this.network,
    });

    factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        coin: json["coin"],
        wallet: json["wallet"],
        network: json["network"],
    );

    Map<String, dynamic> toJson() => {
        "coin": coin,
        "wallet": wallet,
        "network": network,
    };
}

class Hair {
    String color;
    String type;

    Hair({
        required this.color,
        required this.type,
    });

    factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "type": type,
    };
}
