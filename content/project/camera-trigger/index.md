---
title: Wheeled-legged hybrid robot
date: 2018-05-04T08:58:25.233Z
summary: Modeling, control, and implementation
draft: false
featured: true
authors:
  - Embedded and algorithm development(2020)
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
# Multi-degree-of-freedom wheeled-legged hybrid robot

"I have always been eager to build more complex robots. During my junior year, I joined the BIRL team at my university. I participated in the structural and circuit design of a leg-wheel hybrid robot and almost independently completed the entire project, including kinematic modeling and implementing the control code for the robot's motion.
- I conducted Matlab simulations based on the robot's kinematics and solved forward and inverse kinematics using MoveIt in ROS.
- I implemented proportional-velocity control for the three degrees of freedom of the robot's motors using STM32 and CAN.
- I achieved pose transformation for the robot's motion in different planes.

Design and implementation of proportional-velocity (PV) control for a three-degree-of-freedom robot's motors:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=741799493&bvid=BV1Xk4y1W7vd&cid=1149822296&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

Testing the walking capabilities of the second-generation robot:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=571783539&bvid=BV1Az4y1q7Z1&cid=1149822754&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

Real-world application scenario testing:

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=656785847&bvid=BV1Gh4y1d7FG&cid=1149822887&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>