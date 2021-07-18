import 'package:flutter/material.dart';
import 'package:second_app/models/catalog.dart';

class CartModel {
  // Catalog field
  CatalogModel _catalog; // this variable is private

  // collection of IDs and store IDs of each items
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  // Set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map(id)=> _catalog.getById(id); 
}
