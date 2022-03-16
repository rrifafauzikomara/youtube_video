import 'package:flutter/material.dart';

class CardChannel extends StatelessWidget {
  final String channelImageUrl;
  final String channelTitle;

  const CardChannel({
    Key? key,
    required this.channelImageUrl,
    required this.channelTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(
                channelImageUrl,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  channelTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
