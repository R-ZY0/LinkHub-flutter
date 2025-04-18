class MyUser {
  String name;
  String phone;
  
  String imge;
  Map<String, dynamic> socialMediaPlatforms = {};
  

  MyUser({
     this.name='', 
     this.phone='',
     
     this.imge='',
     this.socialMediaPlatforms = const {},

     });
     Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'imge': imge,
      'socialMediaPlatforms': socialMediaPlatforms,
    };
  }
  MyUser fromMap( Map<String, dynamic> myData) {
  return MyUser(
    name: myData['name']??'',
    phone: myData['phoneNumber'] ??'',
    imge: myData['image'] ?? '',
    socialMediaPlatforms: myData['socialMediaPlatforms'] ?? {},
  );


}
}