class Product {
  final String id;
  final String number;
  final String title;
  final String description;
  final String image;
  final String price;
  final List<String>? allergens;

  Product({
    required this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.allergens,
  });

  static List<Product> products = [
    Product(
      id: '1',
      number: '1.1',
      title: 'RED TRUFFLE ROLL',
      description:
          'salmone e cream cheese all’interno e  gambero rosso, tartufo nero al esterno',
      image: 'https://picsum.photos/id/28/600/900',
      allergens: [
        'lupini',
        'sesamo',
        'uova',
        'crostacei',
        'pesce',
        'soia',
        'glutine',
        'latte',
      ],
      price: '€ 22.00',
    ),
    Product(
      id: '2',
      number: '1.2',
      title: 'MANGO ROLL',
      image: 'https://picsum.photos/id/29/600/900',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      allergens: [
        'lupini',
        'sesamo',
        'uova',
        'crostacei',
        'pesce',
        'soia',
        'glutine',
        'latte',
      ],
      price: '€ 18.00',
    ),
    Product(
      id: '3',
      number: '1.3',
      title: 'Terza Spiaggia',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      image: 'https://picsum.photos/id/35/600/900',
      allergens: [
        'lupini',
        'sesamo',
        'uova',
        'crostacei',
        'pesce',
        'soia',
        'glutine',
        'latte',
      ],
      price: '€ 20.00',
    ),
    Product(
      id: '4',
      number: '1.4',
      title: 'Terza Spiaggia',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      image: 'https://picsum.photos/id/31/600/900',
      allergens: [
        'lupini',
        'sesamo',
        'uova',
        'crostacei',
        'pesce',
        'soia',
        'glutine',
        'latte',
      ],
      price: '€ 25.00',
    ),
    Product(
      id: '5',
      number: '1.5',
      title: 'Terza Spiaggia',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      image: 'https://picsum.photos/id/32/600/900',
      allergens: [
        'lupini',
        'sesamo',
        'uova',
        'crostacei',
        'pesce',
        'soia',
        'glutine',
        'latte',
      ],
      price: '€ 30.00',
    ),
  ];
}
