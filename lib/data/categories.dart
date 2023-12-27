import 'package:flutter/material.dart';

import '../model/category.dart';

Map<Categories, Category> categories = {
  Categories.vegetables: Category(
    title: 'sebzeler',
    color: Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category(
    title: 'Meyve',
    color: Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    title: 'Et',
    color: Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    title: 'Günlük',
    color: Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category(
    title: 'Karbonhidratlar',
    color: Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    title: 'Tatlılar',
    color: Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    title: 'Baharat',
    color: Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    title: 'Atıştırmalık',
    color: Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    title: 'Hijyen',
    color: Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    title: 'Diğer',
    color: Color.fromARGB(255, 0, 225, 255),
  ),
};
