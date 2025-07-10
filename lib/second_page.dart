import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class entry {
  final String name;
  final String email;
  final int rating;
  final String message;

  entry({
    required this.name,
    required this.email,
    required this.rating,
    required this.message,
});
}
class _SecondPageState extends State<SecondPage> {
  int _rating = 0;
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController namecontrol = TextEditingController();
  TextEditingController feedbackcontrol = TextEditingController();
  List<entry> feedbacklist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const Text("Full Name:"),
            SizedBox(
              width:500,
              child: TextField(
                controller: namecontrol,
                decoration: InputDecoration(
                  hintText: "Please enter your name"
                ),
              )
            ),
            const SizedBox(height: 10),
            const Text("Email:"),
            SizedBox(
                width:500,
                child: TextField(
                  controller: emailcontrol,
                  decoration: InputDecoration(
                      hintText: "Please enter your email"
                  ),
                )
            ),
            const SizedBox(height: 10),
            const Text("Rating:"),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const Text("Feedback message:"),
            const SizedBox(height: 10),
            TextField(
              controller: feedbackcontrol,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Enter a message as feedback",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                String name = namecontrol.text;
                String email = emailcontrol.text;
                int stars = _rating;
                String feedbackmessage = feedbackcontrol.text;

                feedbacklist.add(
                  entry(
                    name: name,
                    email: email,
                    rating: stars,
                    message: feedbackmessage,
                  ),
                );

                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Your survey summary"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Thank you for your feedback, here are your information and picks:"),
                          const SizedBox(height: 10),
                          Text("Name: $name"),
                          Text("Email: $email"),
                          Text("Rating: $stars ⭐"),
                          Text("Feedback Message: $feedbackmessage")
                        ]
                      ),
                    );
                  }
                );
              },
              child: Text("Submit"),
            )

          ]
      )

      )
    );
  }
}
