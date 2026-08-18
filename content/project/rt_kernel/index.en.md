---
title: University robotics team projects (freshman & sophomore years)
date: 2018-05-04T08:58:25.233Z
weight: 50
summary: Detection, localization and vision recognition on the edge.
draft: false
featured: true
authors:
  - Embedded and algorithm development (2018–2019)
show_date: false
tags:
  - robots_control
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# Projects on the university robotics team

I joined the university's robotics team in my freshman year and kept building up my engineering and algorithm skills across a series of competitions.

## A grayscale line-following board

We found that robots following a line outdoors, or under complicated lighting, are easily disturbed by external light — sunlight above all. So I set out to design a line-following board that could reject external light interference.

The design of this dynamically sunlight-resistant board came down to:

- A differential method that dynamically switches the on-board light source off: first measure the ambient light level, then switch the emitter on to read the reflected intensity. Subtracting the two gives the true reflection produced by the on-board source, which suppresses the influence of external light.
- Otsu's method to dynamically calibrate the threshold between the white line and the black background.
- The project was granted a national utility model patent and has been in continuous use across the team's robotics competitions.

![](xunjiban.png "Design of the grayscale line-following board")

How the board performs under real outdoor sunlight:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=614342194&bvid=BV19h4y1s7Bo&cid=1149805523&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

## Short-range robot localization

This project implemented a localization algorithm built on encoder motors, a gyroscope and a laser rangefinder, fused with an Extended Kalman Filter. By folding in the encoder data, the robot achieves centimeter-level indoor localization at 50Hz even though the laser sensor only runs at 10Hz.

Algorithm testing and visualization:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=614263283&bvid=BV1Jh4y1s7oK&cid=1149806142&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

The same localization algorithm running in an actual competition:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=229312247&bvid=BV1Z8411f7Lm&cid=1149809346&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

## Jetson and YOLO

A road vehicle-counting algorithm built on the Jetson Nano and YOLOv4-tiny.

- Used TensorRT to reach over 18fps on the edge device while staying under 15W.
- Built the data visualization interface on the Node-RED framework.

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=911830540&bvid=BV1aM4y1e7cf&cid=1149805640&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>
