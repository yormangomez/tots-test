class ClientModel {
  num? id;
  String? firstname;
  String? lastname;
  String? email;
  String? address;
  dynamic photo;
  dynamic caption;
  String? createdAt;
  String? updatedAt;
  num? userId;

  ClientModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.photo,
    this.caption,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  ClientModel copyWith({
    num? id,
    String? firstname,
    String? lastname,
    String? email,
    String? address,
    dynamic photo,
    dynamic caption,
    String? createdAt,
    String? updatedAt,
    num? userId,
  }) =>
      ClientModel(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        address: address ?? this.address,
        photo: photo ?? this.photo,
        caption: caption ?? this.caption,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
      );

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        address: json["address"],
        photo: json["photo"],
        caption: json["caption"],
        createdAt: (json["created_at"]),
        updatedAt: (json["updated_at"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "address": address,
        "photo": photo,
        "caption": caption,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user_id": userId,
      };
}
