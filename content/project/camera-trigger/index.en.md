---
title: Wheeled-legged hybrid robot (junior year)
date: 2018-05-04T08:58:25.233Z
weight: 40
summary: Modeling, control and engineering implementation.
draft: false
featured: true
authors:
  - Embedded and algorithm development (2021)
show_date: false
tags:
  - robots_control
aliases:
  - /en/project/camera-trigger/
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# Multi-degree-of-freedom wheeled-legged hybrid robot

I had always wanted to build more complex robots. In my junior year I joined the university's BIRL team, worked on the mechanical structure and circuit design of a wheeled-legged hybrid robot, and completed the kinematic modeling and motion-control code for the project almost entirely on my own.

- Ran Matlab simulations from the robot's kinematics, and solved forward and inverse kinematics with MoveIt in ROS.
- Implemented proportional-velocity control for the robot's three-degree-of-freedom motors on STM32 over CAN bus.
- Implemented pose transformation for the robot across different planes of motion.

Design and implementation of proportional-velocity (PV) control for the three-degree-of-freedom motors:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=741799493&bvid=BV1Xk4y1W7vd&cid=1149822296&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

Walking tests on the second-generation robot:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=571783539&bvid=BV1Az4y1q7Z1&cid=1149822754&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

Testing in a real application scenario:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=656785847&bvid=BV1Gh4y1d7FG&cid=1149822887&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>
