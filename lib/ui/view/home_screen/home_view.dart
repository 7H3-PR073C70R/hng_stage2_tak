import 'package:flutter/material.dart';
import 'package:hng_stage_2_task/ui/view/home_screen/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // The textstyle to use throughout the app
  textStyle(Color color, {double fontSize = 18}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Returning a viewmodel to bind my model class to the ui.
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                model.title,
                style: textStyle(Colors.white),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/I4G.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Goto ',
                        style: textStyle(Colors.black),
                        children: [
                          TextSpan(
                              text: 'https://hng.tech/',
                              style: textStyle(Colors.blue)),
                          TextSpan(
                              text: ' to join the next HNG Internship',
                              style: textStyle(Colors.black))
                        ]),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 280,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(35)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 25.0),
                          child: Text(
                            model.enteredText,
                            style: textStyle(Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: textStyle(Colors.black),
                              hintText: 'Enter Something...',
                              focusColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10, ),
                                    borderSide:
                                        const BorderSide(color: Colors.deepOrange, style: BorderStyle.solid)),
                                ),
                                style: textStyle(Colors.black),
                                onChanged: (value) {
                                  model.updateEnteredText(value);
                                },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
        viewModelBuilder: () => HomeViewModel());
  }
}
