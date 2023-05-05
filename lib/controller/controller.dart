import 'package:get/get.dart';

class PlanetController extends GetxController {
  RxList planetPng = [
    "assets/images/mars.png",
    "assets/images/sun.png",
    "assets/images/moon.png",
    "assets/images/earth.png",
    "assets/images/mercury.png",
  ].obs;

  RxList planetName = [
    'Mars',
    'Sun',
    'Moon',
    'Earth',
    'Mercury',
  ].obs;

  RxList planetInformation = [
    'Mars is the fourth planet from the sun and is often referred to as the "Red Planet" due to its reddish appearance in the night sky. It is a terrestrial planet with a thin atmosphere composed primarily of carbon dioxide, and has surface features such as volcanoes, valleys, and polar ice caps.',
    'Neptune is the eighth and farthest planet from the sun in our solar system. It is a gas giant with a diameter almost four times that of Earth, and it has a blue coloration due to the presence of methane in its atmosphere. Neptune is the fourth-largest planet in terms of diameter and the third-most massive planet in the solar system.',
    'The Moon is the Earths only natural satellite and is the fifth-largest moon in the solar system. It has a diameter of 3,474 kilometers, which is about one-quarter of Earths diameter, and it is the second-densest moon after Jupiters moon Io.The Moons surface is covered in craters, mountains, valleys, and large, dark areas called "seas" or maria.',
    'Earth is the third planet from the sun and is the only known planet in the universe to support life. It is a terrestrial planet, meaning it is a rocky planet with a solid surface, and has a diameter of approximately 12,742 kilometers.The Earth has a thin atmosphere composed primarily of nitrogen and oxygen, which protects life on the planet by absorbing harmful solar radiation and moderating the planets temperature.',
    'Mercury is the smallest planet in our solar system and is the closest planet to the sun. It has a diameter of approximately 4,880 kilometers, which is about one-third the size of Earth.Mercury has a very thin atmosphere composed mainly of helium and traces of sodium, potassium, and oxygen.',
  ].obs;

  RxList planetDistanceFromSun = [
    '250.19',
    '4.4732',
    '93',
    '150.83 ',
    '67.608',
  ].obs;

  RxList planetDistanceFromEarth = [
    '266.11 million km',
    '4.5747 billion km',
    '238,855 miles',
    'Not Available',
    '83.682 million km',
  ].obs;

  RxList planetsAtmospherisPressure = [
    '6.518',
    '100',
    '500',
    '1013.25',
    '350',
  ].obs;
}
