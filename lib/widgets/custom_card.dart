import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String? name;
  const CustomCard({super.key, required this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      //restricting the contetn to a particular area
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage( imageUrl ),
            //while the image is loading show this gif
            placeholder: const AssetImage('assets/no-image.jpg'),
            //auto adjust to max width
            width: double.infinity,
            height: 100,
            //adjust to max height
            fit: BoxFit.cover,
            //duration time of the fade in 
            fadeInDuration: const Duration(milliseconds: 1000),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
              //if name is null write unknown
              child: Text( name ??  'Unknown'),
            ),
        ],
      ),
    );
  }
}