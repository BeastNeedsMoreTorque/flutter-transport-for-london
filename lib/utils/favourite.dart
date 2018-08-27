import 'package:transport_for_london/models/favourite.dart';

bool doFavouritesContainName(
  List<Favourite> favourites,
  String name,
) {
  return favourites.map((favourite) => favourite.name).contains(name);
}

bool doFavouritesContainPath(
  List<Favourite> favourites,
  String path,
) {
  return favourites.map((favourite) => favourite.path).contains(path);
}

List<Favourite> toggleFavourite(
  List<Favourite> favourites,
  Favourite favourite,
) {
  doFavouritesContainPath(favourites, favourite.path)
      ? favourites.removeWhere((element) => element.path == favourite.path)
      : favourites.add(favourite);

  return favourites;
}
