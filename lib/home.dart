import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/cart.dart';
import 'package:flutter_application_1/model/category.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/static/image.dart';
import 'package:flutter_application_1/widgets/cartappbaraction.dart';
import 'package:flutter_application_1/widgets/categorytitle.dart';
import 'package:flutter_application_1/widgets/producttitle.dart';

Cart cart = Cart();

class SimpleEcommerce extends StatefulWidget {
  const SimpleEcommerce({Key? key}) : super(key: key);

  @override
  State<SimpleEcommerce> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SimpleEcommerce> {
  late String searchString;
  @override
  void initState() {
    searchString = '';
    super.initState();
  }

  void setSearchString(String value) => setState(() {
        searchString = value;
      });

  @override
  Widget build(BuildContext context) {
    var listViewPadding =
        const EdgeInsets.symmetric(horizontal: 14, vertical: 20);
    List<Widget> searchResultTiles = [];
    if (searchString.isNotEmpty) {
      searchResultTiles = products
          .where(
              (p) => p.name.toLowerCase().contains(searchString.toLowerCase()))
          .map(
            (p) => ProductTile(product: p),
          )
          .toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onChanged: setSearchString,
        ),
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: searchString.isNotEmpty
          ? GridView.count(
              padding: listViewPadding,
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: .78,
              children: searchResultTiles,
            )
          : ListView(
              padding: listViewPadding,
              children: [
                Text(
                  'Shop by Category',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: manLookRightImageUrl,
                  category: mensCategory,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: womanLookLeftImageUrl,
                  category: womensCategory,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: dogImageUrl, // TODO: Replace with your own image
                  category: petsCategory,
                ),
              ],
            ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  const CallToActionButton(
      {required this.onPressed,
      required this.labelText,
      this.minSize = const Size(266, 45),
      Key? key})
      : super(key: key);
  final Function onPressed;
  final String labelText;
  final Size minSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        minimumSize: minSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

final kGreyBackground = Colors.grey[200];
