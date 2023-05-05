import 'package:first_app/data/question_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1}/${questions.length}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 28),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(questions[index].question!,
                    style:
                        const TextStyle(fontSize: 28.0, color: Colors.white)),
                const SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: secondColor,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: () {},
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 35.0,
                ),
                OutlinedButton(
                    onPressed: () {}, child: const Text("Next Question"))
              ],
            );
          },
        ),
      ),
    );
  }
}
