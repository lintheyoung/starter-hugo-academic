---
title: 积木抓取机器人（高中时期）
date: 2018-05-04T08:58:25.233Z
weight: 60
summary: 用于抓取、存储和堆叠积木的机器人。
draft: false
featured: true
authors:
  - 队长与嵌入式开发（2018）
show_date: false
image:
  filename: featured.png
  focal_point: Top
  preview_only: true
---
# 项目介绍

2018 年，在 DJI RoboMaster 高中生夏令营中，我担任队长并主要负责嵌入式开发。夏令营的主要任务是设计并制造一台能够抓取、存储和堆叠积木的机器人。在该项目中，我的职责包括：

- 协调结构、嵌入式和算法小组之间的沟通，推动整体进度，并解决协作中的问题。
- 在嵌入式部分，完成二连杆机械臂的运动学分析与实际控制。该部分基于 STM32 和 CAN 总线控制底盘 3508 电机与 6002 云台电机，同时实现物料检测与出料控制。
- 设计嵌入式系统与 PC 之间的通信协议，主要通过串口和 JSON 协议向 PC 传输积木角点位置信息，用于优化抓取。

![](robomaster_0.png "机器人整体方案设计")

![](robomaster_1.png "机器人设计与制作")

![](robomaster_2.png "机器人实际测试")
