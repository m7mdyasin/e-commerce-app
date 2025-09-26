import 'package:fruits_market/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHomeBarIconActiveHomeActive,
    inActiveImage: Assets.imagesHomeBarIconInactiveHomeInactive,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHomeBarIconActiveElementActive,
    inActiveImage: Assets.imagesHomeBarIconInactiveElementInactive,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHomeBarIconActiveShoppingCartActive,
    inActiveImage: Assets.imagesHomeBarIconInactiveShoppingCartInactive,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHomeBarIconActiveUserActive,
    inActiveImage: Assets.imagesHomeBarIconInactiveUserInactive,
    name: 'حسابي',
  ),
];
