import 'package:farm_furniture_factory/constansts/image_constants.dart';
import 'package:farm_furniture_factory/utils/widgets/responsive_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveWidget(
        smallScreen: Container(),
        largeScreen: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width / 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          ImageConstants.appLogo,
                          height: screenSize.height / 4,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: TextEditingController(),
                            decoration: const InputDecoration(
                              labelText: 'Search Your Product',
                              border: OutlineInputBorder(),
                            ),
                            // To keep the text form field fixed, use enabled: false.
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.add_shopping_cart),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Cart",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Living Room",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Bed Room",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Dining Table",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Balcony & Outdoor",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Office Furniture",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Home > Living",
                    ).paddingSymmetric(horizontal: screenSize.width / 17),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveWidget.isMediumScreen(context)
                            ? Container()
                            : Expanded(
                                child: Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(20),
                                height: screenSize.height / 5,
                                color: Colors.white,
                                child: const Column(
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Price"),
                                  ],
                                ),
                              )),
                        Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(20),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Living",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      ElevatedButton(
                                        child: const Text("Grid View"),
                                        onPressed: () {
                                          setState(() {
                                            if (isGridView) {
                                              isGridView = false;
                                            } else {
                                              isGridView = true;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    child: isGridView
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    ResponsiveWidget
                                                            .isMediumScreen(
                                                                context)
                                                        ? 3
                                                        : 4,
                                                crossAxisSpacing: 8.0,
                                                mainAxisSpacing: 8.0,
                                                childAspectRatio:
                                                    0.6, // Adjust as needed
                                              ),
                                              itemCount: 12,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  elevation: 2,
                                                  shape:
                                                      RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .vertical(
                                                            top: Radius
                                                                .circular(
                                                                    8.0),
                                                          ),
                                                          child:
                                                              Image.network(
                                                            ImageConstants
                                                                .appLogo,
                                                            fit: BoxFit.fill,
                                                            width: double
                                                                .infinity,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              "Bedroom",
                                                              style:
                                                                  TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    16.0,
                                                              ),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            const SizedBox(
                                                                height: 4.0),
                                                            const Text(
                                                              "1232",
                                                              style:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize:
                                                                    14.0,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 4.0),
                                                            SizedBox(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child: const Text(
                                                                      'Add to cart'),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : ListView.separated(
                                      shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 12,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  Image.asset(
                                                    ImageConstants.appLogo,
                                                    height: 100,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  const Column(
                                                    children: [
                                                      Text("Ruby Tv"),
                                                      Text("12000"),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                            'Add to cart'),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return const Divider(
                                                color: Colors.grey,
                                                thickness: 1,
                                              );
                                            },
                                          ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
