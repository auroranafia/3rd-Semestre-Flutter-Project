class Product {
  String _name;
  double _priceUSD;
  double _heelHeight; // in cm
  String _description;
  String _image;

  Product(this._name, this._priceUSD, this._heelHeight, this._description, this._image);

  // Encapsulation
  String get name => _name;
  double get priceUSD => _priceUSD;
  double get heelHeight => _heelHeight;
  String get description => _description;
  String get image => _image;
}
