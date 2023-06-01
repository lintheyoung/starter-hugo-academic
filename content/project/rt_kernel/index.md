---
title: Projects in Robot Team
date: 2018-05-04T08:58:25.233Z
summary: Detection and localization
draft: false
featured: true
authors:
  - Embedded and algorithm development(2018~2019)
show_date: false
tags:
  - robots_control
# links:
#   - url: https://github.com/qiayuanliao/OpenMGSLS
#     name: Source
#     icon_pack: fab
#     icon: github
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# Several projects within the school robotics team

Since the beginning of my freshman year, I have joined the university's robotics team and continuously improved my engineering and algorithmic skills through participating in numerous competitions.

## Design of a grayscale line tracking board

We found that the robot is susceptible to external light interference (especially sunlight) when tracking outside of indoor environments. Therefore, I aim to construct a grayscale line tracking board that can resist external light disturbances.

Design of a dynamic line tracking board resistant to external sunlight disturbances:

- Differential method is employed to dynamically turn off the board's own light source, measure the intensity of external light, and then turn on the self-illumination to obtain the reflection intensity. By subtracting these values, the actual reflection intensity of the internal light source can be obtained, thus reducing the impact of external light.
- Dynamic calibration of the white line/black background threshold is achieved using the Otsu algorithm.
- This project has been granted a national utility model patent and is currently being used in various robotics competitions within the team.

![](xunjiban.png "The design of a grayscale line tracking board")

The performance of the line tracking board under actual external sunlight disturbances.

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=614342194&bvid=BV19h4y1s7Bo&cid=1149805523&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>


## Design and implementation of small-area robot localization

Implementation and application of robot localization algorithm based on encoder motors, gyroscope, and laser rangefinder. EKF (Extended Kalman Filter) is used to fuse data from encoders, gyroscope, and laser rangefinder. By fusing the data with encoders, the robot achieves centimeter-level indoor localization at a frequency of 50Hz, even with the laser sensor operating at only 10Hz.

Algorithm testing and visualization

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=614263283&bvid=BV1Jh4y1s7oK&cid=1149806142&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

The application of this localization algorithm in actual competitions

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=229312247&bvid=BV1Z8411f7Lm&cid=1149809346&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

## Jetson & YOLO
Design of a road vehicle counting algorithm based on Jetson Nano and YOLOv4-tiny.

- Utilizing TensorRT to achieve recognition frame rates above 18fps on edge devices with power consumption below 15W;

- Designing a data visualization interface based on the Node-RED framework".

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=911830540&bvid=BV1aM4y1e7cf&cid=1149805640&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>