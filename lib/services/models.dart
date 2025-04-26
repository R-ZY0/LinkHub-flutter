class MyUser {
  String name;
  String phone;
  String imge;
  String myNetwork;
  Map<String, dynamic> socialMediaPlatforms = {};
  

  MyUser({
     this.name='', 
     this.phone='',
     this.imge='',
     this.socialMediaPlatforms = const {},
     this.myNetwork=''
     
     });
     Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'imge': imge,
      'socialMediaPlatforms': socialMediaPlatforms,
      'myNetwork': myNetwork
    };
  }
  
  MyUser fromMap(Map<String, dynamic> myData) {
  return MyUser(
    name: myData['name'] ?? '',
    phone: myData['phone'] ?? '', // Ensure this matches the key in your data source
    imge: myData['imge'] ?? '', // Ensure this matches the key in your data source
    socialMediaPlatforms: myData['socialMediaPlatforms'] ?? {},
    myNetwork: myData['myNetwork'] ?? [],
  );
}
  MyUser creatFriend(Map<String, dynamic> myData) {
  return MyUser(
    name: myData['name'] ?? '',
    phone: myData['phone'] ?? '', // Ensure this matches the key in your data source
    imge: myData['imge'] ?? '', // Ensure this matches the key in your data source
    socialMediaPlatforms: myData['socialMediaPlatforms'] ?? {},
    
  );
}
}
class MyNetwork{
  List<String>myNetwork;
  MyNetwork({this.myNetwork=const[]});

  Map<String, dynamic> toMap() {
    return {};
  }
  MyNetwork fromMap(Map<String, dynamic> myData) {
    return MyNetwork(myNetwork: myData['myNetwork']);
  }

}