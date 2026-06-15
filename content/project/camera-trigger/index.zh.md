---
title: 轮腿复合机器人（大三）
date: 2018-05-04T08:58:25.233Z
weight: 40
summary: 建模、控制与工程实现。
draft: false
featured: true
authors:
  - 嵌入式与算法开发（2021）
show_date: false
tags:
  - robots_control
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# 多自由度轮腿复合机器人

我一直希望能够制作更复杂的机器人。大三期间，我加入了学校的 BIRL 团队，参与轮腿复合机器人的结构和电路设计，并几乎独立完成了该项目的运动学建模和机器人运动控制代码实现。

- 基于机器人运动学进行 Matlab 仿真，并使用 ROS 中的 MoveIt 求解正逆运动学。
- 基于 STM32 和 CAN 总线，实现机器人三自由度电机的比例-速度控制。
- 实现机器人在不同运动平面中的姿态变换。

三自由度机器人电机比例-速度（PV）控制的设计与实现：

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=741799493&bvid=BV1Xk4y1W7vd&cid=1149822296&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

第二代机器人行走能力测试：

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=571783539&bvid=BV1Az4y1q7Z1&cid=1149822754&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>

真实应用场景测试：

<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
    <iframe src="//player.bilibili.com/player.html?aid=656785847&bvid=BV1Gh4y1d7FG&cid=1149822887&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position:absolute; height: 100%; width: 100%;"> </iframe>
</div>
