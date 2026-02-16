import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CurrentWeatherSkeleton extends StatelessWidget {
  const CurrentWeatherSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        baseColor: Color(0xFF3A3A3A),
        highlightColor: Color(0xFF545454),
        duration: Duration(milliseconds: 1200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Bone(height: 24, width: 24, shape: BoxShape.circle),
              const SizedBox(width: 4),
              Bone(
                height: 24,
                width: 90,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Bone(
                height: 16,
                width: 120,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 14),
              Bone(height: 58, width: 58, shape: BoxShape.circle),
              const SizedBox(width: 10),
              Bone(
                height: 58,
                width: 58,
                borderRadius: BorderRadius.circular(24),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 5,
                children: [
                  Bone(
                    height: 18,
                    width: 40,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  Bone(
                    height: 18,
                    width: 60,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  Bone(
                    height: 18,
                    width: 100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
