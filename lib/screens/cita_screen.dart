import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class CitaScreen extends StatefulWidget {
  const CitaScreen({super.key}); 
  @override
  State<CitaScreen> createState() => _CitaScreenState();
}

class _CitaScreenState extends State<CitaScreen> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: BigText(text: 'Novedades', color: AppTheme.secondaryTextColor,),
            ),

            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, index){
                  return _buildNovedadPoster(index);
                }
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Elige tu peluqueria', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(

                  margin: const EdgeInsets.only(right: 10,left: 10),
                  
                  child: GestureDetector(
                    onTap: () { Navigator.pushNamed(context, 'peluqueros'); },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
                      child: Column(
                        children: [
                          FadeInImage(
                            image: NetworkImage( 'https://picsum.photos/500/300' ),
                            placeholder: const AssetImage('assets/no-image.jpg'),
                            width: double.infinity,
                            height: 120,
                            fit: BoxFit.cover,
                            fadeInDuration: const Duration(milliseconds: 1000),
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerEnd,
                            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
                            child: BigText(text: 'Peluqueria', color: AppTheme.secondaryTextColor, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),

            const SizedBox(height: 120,)
          ],
        ),
      )
    );
  }
}

Widget _buildNovedadPoster(int index){
  return Stack(
    children: [
      Container(
        height: 320,
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
          image: const DecorationImage(
            image: NetworkImage('https://picsum.photos/500/300'),
            opacity: 0.4,
            fit: BoxFit.cover
          ),
        ),
      ),
      Container(
        height: 320,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Regalos",),
              SizedBox(height: 10,),
              SmallText(text: 'Reciba descuentos exclusivos en las marcas mas populares del momento'),
            ],
          ),
        ),
      ),
    ],
  );
}