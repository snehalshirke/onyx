import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onyx/utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: non_constant_identifier_names
      body: OrientationBuilder(builder: (context, Orientation) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Brand Logo and Name
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logoimg.jpg',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'LOGO',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    // Search, Wishlist, Bag buttons
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // Handle search button press
                            Fluttertoast.showToast(
                              msg: "Search",
                              toastLength: Toast
                                  .LENGTH_SHORT, // Duration for which the toast should be visible
                              gravity: ToastGravity
                                  .BOTTOM, // Position of the toast message on the screen
                              timeInSecForIosWeb:
                                  1, // Time for which the message will be displayed on the screen
                              backgroundColor: Colors
                                  .red, // Background color of the toast message
                              textColor: Colors
                                  .white, // Text color of the toast message
                              fontSize:
                                  16.0, // Font size of the toast message text
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {
                            // Handle wishlist button press
                            Fluttertoast.showToast(
                              msg: "favorite",
                              toastLength: Toast
                                  .LENGTH_SHORT, // Duration for which the toast should be visible
                              gravity: ToastGravity
                                  .BOTTOM, // Position of the toast message on the screen
                              timeInSecForIosWeb:
                                  1, // Time for which the message will be displayed on the screen
                              backgroundColor: Colors
                                  .red, // Background color of the toast message
                              textColor: Colors
                                  .white, // Text color of the toast message
                              fontSize:
                                  16.0, // Font size of the toast message text
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag),
                          onPressed: () {
                            // Handle bag button press
                            Fluttertoast.showToast(
                              msg: "cart",
                              toastLength: Toast
                                  .LENGTH_SHORT, // Duration for which the toast should be visible
                              gravity: ToastGravity
                                  .BOTTOM, // Position of the toast message on the screen
                              timeInSecForIosWeb:
                                  1, // Time for which the message will be displayed on the screen
                              backgroundColor: Colors
                                  .red, // Background color of the toast message
                              textColor: Colors
                                  .white, // Text color of the toast message
                              fontSize:
                                  16.0, // Font size of the toast message text
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Second Row with Back Button and Text
              Container(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Handle back button press
                        Navigator.pushNamed(
                          context,
                          RoutesName.otpVerification,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'IBMPlexSansCondensed-SemiBold.ttf',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 140,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 15),
                      CircularListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'T-shirt',
                      ),
                      SizedBox(width: 15),
                      CircularListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Shirt',
                      ),
                      SizedBox(width: 15),
                      CircularListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Co-ords',
                      ),
                      SizedBox(width: 15),
                      CircularListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Bottoms',
                      ),
                      SizedBox(width: 15),
                      CircularListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Tops',
                      ),
                    ],
                  ),
                ),
              ),

              // Horizontal Category RecyclerView
              // Container(
              //   height: 100,
              //   alignment: const Alignment(100, 100), // Adjust height as needed
              //   child: Padding(
              //     padding: const EdgeInsets.all(19.52),
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 7,
              //       itemBuilder: (context, index) {
              //         // Build circular category items here
              //         return CircleAvatar(
              //           radius: 35,
              //           backgroundColor: Colors.grey.shade600,
              //           //child: Text('Category $index'),
              //         );
              //       },
              //     ),
              //   ),
              // ),

              // Text "Find your style"
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Find your style',
                  style: TextStyle(
                    fontFamily: 'IBMPlexSansCondensed-SemiBold.ttf',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              //==========================================================================================//
              //#CONTAINER CLASS 1
              // Two Horizontal RecyclerViews with Categories

              const SizedBox(
                height: 160,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 25),
                      SquareListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'T-shirt',
                      ),
                      SizedBox(width: 25),
                      SquareListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Shirt',
                      ),
                      SizedBox(width: 25),
                      SquareListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Co-ords',
                      ),
                    ],
                  ),
                ),
              ),

              // const SizedBox(height: 0),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 0, 10, 10),
              //   child: Container(
              //     height: 150, // Adjust height as needed
              //     margin: const EdgeInsets.symmetric(horizontal: 7),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         const SizedBox(height: 5),
              //         Container(
              //           height: 120,
              //           child: ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             itemCount: 3,
              //             itemBuilder: (context, index) {
              //               List<String> categoryNames = [
              //                 'Mike',
              //                 'Darla',
              //                 'Clain',
              //                 'Eleven',
              //               ];
              //               return Container(
              //                 width: 110,
              //                 height: 240,
              //                 margin:
              //                     const EdgeInsets.symmetric(horizontal: 10),
              //                 color: const Color.fromARGB(255, 211, 203, 203),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       categoryNames[index],
              //                       style: const TextStyle(color: Colors.white),
              //                     ),
              //                   ],
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 160,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 25),
                      SquareListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Tops',
                      ),
                      SizedBox(width: 25),
                      SquareListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Bottoms',
                      ),
                      SizedBox(width: 25),
                      SquareListView(
                        imagePath: 'assets/images/logoimg.jpg',
                        name: 'Dress',
                      ),
                    ],
                  ),
                ),
              ),

              //====================================================================================//
              const SizedBox(height: 20),
              // CardBox with Swipeable Cards
              Container(
                height: 200,
                width: 800, // Adjust height as needed
                child: PageView.builder(
                  itemCount: 3,
                  controller: PageController(viewportFraction: 0.9),
                  itemBuilder: (context, index) {
                    // Build swipeable cards here
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 0, 130),
                        child: Center(
                            child: Text(
                          'Influencers Pick',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Barlow-Medium.ttf',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              // Text "Get it on your budget"
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Text(
                  'Get it on your budget',
                  style: TextStyle(
                    fontFamily: 'Barlow-Medium.ttf',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    height: 2,
                  ),
                ),
              ),

              // Four CardViews in Two Rows
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 120,
                      width: 180,
                      child: const Expanded(
                        child: Card(
                          child: ListTile(
                              //title: Text('Card 1'),
                              ),
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 180,
                      child: const Expanded(
                        child: Card(
                          child: ListTile(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 120,
                      width: 180,
                      child: const Expanded(
                        child: Card(
                          child: ListTile(),
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 180,
                      child: const Expanded(
                        child: Card(
                          child: ListTile(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CircularListView extends StatelessWidget {
  final String imagePath;
  final String name;

  const CircularListView({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.0), // Black border
          ),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ClipOval(
              child: Image.asset(imagePath),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(name),
      ],
    );
  }
}

class SquareListView extends StatelessWidget {
  final String imagePath;
  final String name;

  const SquareListView({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle, // Change to rectangle
            border: Border.all(color: Colors.black, width: 1.0), // Black border
          ),
          child: SizedBox(
            height: 125,
            width: 120,
            child: ClipRect(
              child: Image.asset(imagePath),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(name),
      ],
    );
  }
}
