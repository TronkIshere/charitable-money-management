import 'package:flutter/material.dart';

class CampaignBanner extends StatelessWidget {
  final String image;
  const CampaignBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.network(image, fit: BoxFit.cover),
        ),
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black45,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {},
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 260,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            ),
          ),
        ),
      ],
    );
  }
}
