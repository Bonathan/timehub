import 'package:flutter/material.dart';
import 'package:timehub/functions/supabase.dart' as supaService;
import 'package:timehub/cards/cards.dart' as card;
import 'package:timehub/globals/styles.dart' as styles;
import 'package:timehub/globals.dart' as globals;
import 'package:timehub/globals/widgets.dart';

class ToDoLogin extends StatelessWidget {
  const ToDoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return card.UniCard(
        content: ToDoContent(),
        title: "To Do",
        style: styles.textWhite,
        color: styles.darkGrey);
  }
}

class ToDoContent extends StatelessWidget {
  const ToDoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 15, bottom: 25),
          child: Text('Sign Up!', style: styles.smallHeadWhite)),
      Container(
          width: 350,
          height: 315,
          child: Card(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      defaultTextField(hintText: 'E-Mail'),
                      defaultTextField(hintText: 'Password'),
                      defaultTextField(hintText: 'Confirm password'),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: 25,
                              width: 75,
                              child: Center(child: Text('Sign Up')),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(5),
                              )))
                    ]),
              ),
              color: styles.trueWhite))
    ]);
  }
}
