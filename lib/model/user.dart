class User {
  final String name;
  final String imgUrl;
  final String specialty;
  final String location;
  final int experience;
  final int age;
  final String bio;
  final String contact;
  bool isLiked;
  bool isSwipedOff;

  User({
    required this.name,
    required this.age,
    required this.bio,
    required this.specialty,
    required this.experience,
    required this.contact,
    required this.imgUrl,
    required this.location,
    this.isLiked = false,
    this.isSwipedOff = false,
  });
}