// OnBoarding Models
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}

// login models
class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(
    this.id,
    this.name,
    this.numOfNotifications,
  );
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(
    this.phone,
    this.email,
    this.link,
  );
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(
    this.customer,
    this.contacts,
  );
}
