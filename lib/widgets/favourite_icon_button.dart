import 'package:flutter/material.dart';

class FavouriteIconButton extends IconButton {
  FavouriteIconButton(
    bool isFavourite,
    VoidCallback onPressed, {
    Key key,
  }) : super(
          icon: new Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
          key: key,
          onPressed: onPressed,
        );
}
