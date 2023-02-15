
import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class PeluquerosScreen extends StatelessWidget {
  const PeluquerosScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    
    PageController pageController = PageController(viewportFraction: 0.75);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: BigText(text: 'PELUCAPP', color: AppTheme.secondaryTextColor,),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 35),
            child: GestureDetector(
              onTap: () {
                
              },
              child: const Icon(
                Icons.notifications_sharp,
                color: AppTheme.secondaryTextColor,
              )
            )
          )
        ],
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SmallText(text: 'Elige tu pelquero favorito', color: AppTheme.secondaryTextColor,),
            ),
            Container(
              height: 400,
              child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, index){
                  return _buildPeluquerosCard(index);
                }
              ),
            ),
          ],
        )
    );
  }
}

Widget _buildPeluquerosCard(int index){
  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(          
          height: 300,
          decoration: const BoxDecoration(
            color: AppTheme.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0), //(x,y)
                    blurRadius: 8.0,
                  ),
                ],
          ),
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            padding: EdgeInsets.only(left: 15,right: 15),
            width: 290,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70,),
                BigText(text: "Fabio", color: AppTheme.secondaryTextColor,),
                const SizedBox(height: 10,),
                BigText(text: 'Servicios disponibles:', color: AppTheme.secondaryTextColor, size: 20),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.check_circle),
                        onPressed: () {},
                        color: AppTheme.buttomColor,
                      ),
                  ),
              ],
            ),
          ),
        ),
      ),
      const Align(
        alignment: Alignment.topCenter,
        child: CircleAvatar(
            maxRadius: 80,            
            backgroundImage: NetworkImage('https://i.pinimg.com/originals/66/c6/a2/66c6a209ac4100d91e1112896a8551b5.jpg'),
           ),
      ),
    ],
  );
}