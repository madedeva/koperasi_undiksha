class ListUsersModel {
  ListUsersModel({
    this.user_id,
    this.username,
    this.nama,
    this.saldo,
  });

  int? user_id;
  String? username;
  String? nama;
  double? saldo;

  factory ListUsersModel.fromJson(Map<String, dynamic> json) => ListUsersModel(
        user_id: int.parse(json["user_id"]),
        username: json["username"],
        nama: json["nama"],
        saldo: double.parse(json["saldo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": user_id,
        "username": username,
        "nama": nama,
        "saldo": saldo,
      };
}
