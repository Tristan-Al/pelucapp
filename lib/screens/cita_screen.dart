import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CitaScreen extends StatefulWidget {
  const CitaScreen({super.key});
  @override
  State<CitaScreen> createState() => _CitaScreenState();
}

class _CitaScreenState extends State<CitaScreen> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 320;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {      
      setState(() {
        _currPageValue  = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    //Elimina de la memoria el page controller cuando cambiamos de screen
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final peluqueriasServices = Provider.of<PeluqueriasServices>(context);

    if (peluqueriasServices.isLoading) return LoadingScreen();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: BigText(
              text: 'Novedades',
              color: AppTheme.mainTextColor,
            ),
          ),
          Container(
            height: 300,
            child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildNovedadesItem(index);
            }
            ),
          ),

          SizedBox(height: 10,),

          new DotsIndicator(
            dotsCount: 5,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppTheme.secondary,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Elige tu peluqueria',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _PeluqueriasListView(peluqueriasServices: peluqueriasServices),
        ],
      ),
    );
  }


  Widget _buildNovedadesItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    
    } else if( index == _currPageValue.floor()+1){
      
      var currScale = _scaleFactor+(_currPageValue - index + 1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    
    } else if( index == _currPageValue.floor()-1){
      
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    
    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
              image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/500/300'),
                  opacity: 0.4,
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Regalos",
                    color: AppTheme.secondaryTextColor
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SmallText(
                    text: 'Reciba descuentos exclusivos en las marcas mas populares del momento',
                    color: AppTheme.secondaryTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PeluqueriasListView extends StatelessWidget {
  const _PeluqueriasListView({
    super.key,
    required this.peluqueriasServices,
  });

  final PeluqueriasServices peluqueriasServices;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: peluqueriasServices.peluquerias.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          peluqueriasServices.peluqueriaSeleccionada = peluqueriasServices.peluquerias[index];
          Navigator.pushNamed(context, 'peluqueros');
        },
        child: Container(
          height: 300,
          margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: peluqueriasServices.peluquerias[index].imagen == null
                ? Image(
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover,
                )
                : FadeInImage(
                  image:NetworkImage(peluqueriasServices.peluquerias[index].imagen!),
                  placeholder:const AssetImage('assets/no-image.jpg'),
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 1000),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: '${peluqueriasServices.peluquerias[index].nombre}',
                        color: AppTheme.mainTextColor,
                        size: 22
                      ),
                      SmallText(text: "Calle: Peluqueria.calle", color: Colors.black45),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      );
    });
  }
}