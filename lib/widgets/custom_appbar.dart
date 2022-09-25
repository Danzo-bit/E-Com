
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;
  final bool automaticallyImplyLeading;
  final bool isWishlistOn;
 const CustomAppBar({Key? key, required this.title, this.automaticallyImplyLeading = true, this.isWishlistOn = true}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Align(
        child: Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child:Text(
              title,
              style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white)
            )),
      ),
      iconTheme: const IconThemeData(
          color: Colors.black
      ),
      actions: [
        isWishlistOn != true ?
        Container()
        :IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/wishlist');
            },
            icon: const Icon(Icons.favorite)
        )],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

}