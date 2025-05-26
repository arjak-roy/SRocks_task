import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks/Data/Remote/Response/status.dart';
import 'package:s_rocks/Utils/Widgets/assetsParser.dart';
import 'package:s_rocks/View%20Model/Home/homeVM.dart';
import 'package:s_rocks/View%20Model/Home/servicesVM.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Servicesvm>(context, listen: false).getServices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 24, 23, 28),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 169, 1, 63),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 42, 42, 42),
          ),
          height: 50,
          child: Row(
            children: [
                Expanded(
                flex: 1,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(size: 30, Icons.search, color: Colors.white),
                ),
              ),
              Expanded(
                flex: 4,
                child: TextField(
                  autofocus: false, 
                  decoration: const InputDecoration(
                    border: InputBorder.none, 
                    hintText: 'Search "Punjabi music"',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 12.0,
                    ), 
                  ),
                  style: const TextStyle(color: Colors.white), 
                  onChanged: (value) {
                    print('Search query: $value');
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(height: 30, width: 0.5, color: Colors.white),
                        Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(size: 30, Icons.mic, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.only(right: 20),
        actions: [CircleAvatar(child: Icon(Icons.person, color: Colors.purple))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(255, 169, 1, 63),
                          const Color.fromARGB(255, 85, 1, 32),
                        ],
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          Text(
                            "Claim your",
                            style: GoogleFonts.syne(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700,letterSpacing: 0),
                            
                          ),
                          Text(
                            "Free Demo",
                            style: GoogleFonts.lobsterTwo(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "for custom music production",
                            style: GoogleFonts.syne(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                    SizedBox(
                      height: 20, 
                    ),
                    Container(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: (){},
                           child: Text('Book Now',
                           
                            style: GoogleFonts.syne(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                            )
                            ,),
                      ),
                    ),
                        ],
                          )
                    ),
                  ),

                  Positioned(
                    left: -40,
                    bottom: 0,
                    child: Container(
                      height: 135,
                      width: 135,
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
                      child: Image.asset("assets/circle.png", fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    right: -40,
                    bottom: 5,
                    child: Container(
                      height: 135,
                      width: 135,
                      child: Image.asset("assets/rect.png", fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Center(
                          child: Text(
                            "Hire hand-picked Pros for popular music services",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Consumer<Servicesvm>(
                        builder: (BuildContext context, value, child) {  
                        if(value.servicesMain.status == Status.LOADING){return CircularProgressIndicator();}
                        // print(
                        //   value.servicesMain
                        // );
                        // if(value.servicesMain.status == Status.LOADING){return CircularProgressIndicator();}
                        else if(value.servicesMain.status == Status.ERROR){return Text(value.servicesMain.message.toString());}
                        // print(
                        //   value.servicesMain.data
                        // );
                        else{
                          return Expanded(
                            child: ListView.builder(
                              itemCount: value.servicesMain.data!.services.length,
                              itemBuilder: (context, index) {
                                final assets = Assetsparser.fromSting(value.servicesMain.data!.services[index].assetPath.toString());
                                return InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/servicePage', arguments: value.servicesMain.data!.services[index]);
                                  },
                                  child: Container(
                                    height: 100,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                            border: Border.all(width: 2.0,color: Color.fromARGB(255, 44, 45, 49)),
                                            image: DecorationImage(alignment: Alignment.center,image: AssetImage(assets.assetPath), fit: BoxFit.cover, filterQuality: FilterQuality.high, colorFilter: ColorFilter.mode(const Color.fromARGB(154, 60, 60, 60), BlendMode.darken,),opacity: 0.3),
                                            borderRadius: BorderRadius.all(
                                              Radius.elliptical(20, 25)
                                            ),

                                    ),
                                    margin: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                  
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage(assets.iconName), fit: BoxFit.cover, filterQuality: FilterQuality.high),
                                                borderRadius: BorderRadius.all(
                                                  Radius.elliptical(20, 25)
                                                ),
                                        
                                                ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  value.servicesMain.data!.services[index].serviceName.toString(),
                                                  style: GoogleFonts.syne(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 15, fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  value.servicesMain.data!.services[index].serviceDescription.toString(),
                                                  style: GoogleFonts.syne(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 13, fontWeight: FontWeight.w400),
                                                ),
                                                                          
                                            ]),                                                                      
                                          ],
                                        ),
                                        Container(
                                          child: Icon(
                                            size: 50,
                                            Icons.arrow_right,
                                            color: const Color.fromARGB(255, 255, 255, 255),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }

                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
       Consumer<Homevm>(
          builder: (BuildContext context, value, child) {
          return
       Container(
      decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xffAEADB2),
              width: 0.3,
            ),
          ),
        ),

        child: BottomNavigationBar(
            onTap: (value) {
              Provider.of<Homevm>(context, listen: false).setCurrentIndex(value);
            },
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            currentIndex: value.currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'News'),
              BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Track Box'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Projects'),
            ],
          ));
          }
        ),
      );
  }
}
