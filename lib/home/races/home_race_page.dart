import 'package:flutter/material.dart';

class HomeRacePage extends StatelessWidget {
  final String race;
  const HomeRacePage(this.race, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      decoration: BoxDecoration(
        color: Colors.black38,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: AssetImage(
            'images/${race}_background.png',
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 55,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel egestas dolor, nec dignissim metus. Donec augue elit, rhoncus ac sodales id, porttitor vitae est. Donec laoreet rutrum libero sed pharetra. Duis a arcu convallis, gravida purus eget, mollis diam. \n"
                  "Praesent non urna non mauris laoreet ultricies eget at enim. Phasellus lacus odio, ullamcorper ac ipsum in, tincidunt tincidunt massa. Suspendisse ut malesuada sapien, vitae mollis diam. Suspendisse tristique et ex non faucibus. Pellentesque a urna risus. Ut non enim finibus, tempus dui eget, tincidunt sem. \n"
                  "Phasellus sed mauris elit. Pellentesque condimentum lorem vitae justo congue, ut semper nisi gravida. Sed viverra nibh eget tincidunt convallis. In egestas non tortor at tempor. Nullam maximus mi ac pharetra dictum. Sed condimentum diam orci, eget condimentum ipsum convallis quis. Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipiscing velit, sed quia non numquam do eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          const SizedBox(width: 100,),
          Expanded(
            flex: 45,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'images/${race}_keyart.png',
                height: 200,
                width: 150,
              ),
            ),
          )
        ],
      ),
    );
  }
}
