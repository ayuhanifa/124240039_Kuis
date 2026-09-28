class User {
  String username;
  String password;
  String nama;


  User({
    required this.username,
    required this.password,
    required this.nama,
  });
}


List<User> users = [
   User(username: "ayu", password: "039", nama: "ayuhanifa"),
   User(username: "lucy", password: "syantik", nama: "lucyana"),
];
