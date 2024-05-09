class User {
  final int userID;
  final String username;
  final String email;
  final String namalengkap;
  final String tempatlahir;
  final String alamat;
  final String nomer;

  User({
    required this.userID,
    required this.username,
    required this.email,
    required this.namalengkap,
    required this.tempatlahir,
    required this.alamat,
    required this.nomer,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: int.parse(json['UserID']),
      username: json['Username'],
      email: json['Email'],
      namalengkap: json['nama_lengkap'],
      tempatlahir: json['tempat_lahir'],
      alamat: json['alamat'],
      nomer: json['nomer'],
    );
  }
}
