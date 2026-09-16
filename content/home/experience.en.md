---
# An instance of the Experience widget.
# Documentation: https://wowchemy.com/docs/page-builder/
widget: experience

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 70

title: Experience
subtitle:

# Date format for experience
#   Refer to https://wowchemy.com/docs/customization/#date-format
date_format: Jan 2006

# Experiences.
#   Add/remove as many `experience` items below as you like.
#   Required fields are `title`, `company`, and `date_start`.
#   Leave `date_end` empty if it's your current employer.
#   Begin multi-line descriptions with YAML's `|2-` multi-line prefix.
experience:
  - title: Founder & CTO, consumer smart-hardware startup
    company: Pest Control smart hardware for global markets
    company_url: '/project/cstartup/'
    company_logo: ''
    location: Hangzhou / Shenzhen
    date_start: '2024-04-01'
    date_end:
    description: |2-
        Main responsibilities:

        * Explored new directions after XbotPark Camp and settled on Pest Control smart hardware for global markets, through market screening, user interviews and field research.
        * As founder and CTO, led product definition, prototype design and mass-production introduction for consumer rodent- and mosquito-control devices.
        * Built the early field-testing and multi-sensor data-collection systems, and drove several validation rounds across mechanical structure, circuits, embedded systems, detection and safety strategy.
        * Led the global multi-region IoT hardware and software architecture, the app plan, and an internal AI-assisted workflow for hardware–software co-development.
        * Drove the [consumer Pest Control hardware startup](/project/cstartup/) (2024–present) from B2B validation to consumer productization and mass-production readiness.

  - title: Co-founder & CTO, robotics studio
    company: Guangzhou Shanyue Information Technology Co., Ltd.
    company_url: ''
    company_logo: ''
    location: Guangzhou
    date_start: '2022-07-01'
    date_end:
    description: |2-
        Main responsibilities:

        * Designed complete robot solutions, hardware and software.
        * Made the robots more competitive at the same or lower hardware cost, through better software, control algorithms and system design.
        * Built dynamic visual design and perception capabilities for interactive art installations.
        * Productized [DeDeMotor, an improved motor driver](/project/studio/#dedemotor); [DeDeYOLO, a low-cost low-power YOLO camera](/project/studio/#dedeyolo); [Video2Tag, a web-based auto-labeling tool](/project/studio/#video2tag); and [DeDeIMU, a high-performance 6-axis gyroscope](/project/studio/#dedeimu).

  - title: Undergraduate experience
    company: School of Automation, Guangdong University of Technology
    company_url: ''
    company_logo: ''
    location: Guangzhou, China
    date_start: '2018-09-01'
    date_end: '2022-06-30'
    description: |2-
        * 2020 GDUT Outstanding Student First-Class Scholarship (ranked 1/473).
        * 2021 GDUT Outstanding Student First-Class Scholarship (ranked 5/473).
        * 2021 Huawei Intelligent Base Scholarship (ranked 1/473).
        * 2019 China Robot Competition (team lead) — national first and second prizes.
        * 2020 Guangdong Undergraduate Electronic Design Contest (team lead) — provincial first prize.
        * 2020 Guangdong Engineering Undergraduate Experimental Skills Competition, autonomous transport vehicle (team lead) — provincial first prize.
        * 2021 "Challenge Cup" Guangdong Undergraduate Extracurricular Academic and Technological Works Competition (hardware and software lead) — provincial first prize.
        * 2020 Mathematical Contest in Modeling (programming lead) — Honorable Mention.

  - title: Research group, senior year after graduate admission
    company: Prof. Xuefei Li's group, School of Mechanical and Aerospace Engineering, Jilin University
    company_url: ''
    company_logo: ''
    location: Remote
    date_start: '2021-09-30'
    date_end: '2022-03-01'
    description: |2-
        Main responsibilities:

        * Built a Docker-based ROS1/ROS2 development environment and a ROS Bridge Docker image, so that edge devices such as the Jetson AGX Xavier could run ROS1 and ROS2 at the same time.
        * Converted Livox LiDAR data into KITTI format, then trained PointPillars on the Livox dataset and implemented forward inference. Combined with ROS bags recorded in a real mining environment, this enabled truck detection in point clouds — the groundwork for later recognizing truck unloading poses.
        * Completed my undergraduate thesis: estimating an object's pose relative to the camera frame from an RGB image and the object's CAD model.

  - title: Head of the programming group
    company: GDUT Robotics Team
    company_url: ''
    company_logo: ''
    location: Guangzhou, China
    date_start: '2018-10-01'
    date_end: '2021-10-01'
    description: |2-
        Learned and practiced mechanical design, circuits, programming and robot control in a systematic way. As head of the programming group, led the team to 3 national awards and 4 provincial first prizes or above, along with 2 national invention patents.

  - title: Embedded development internship
    company: DJI (SZ DJI Technology Co., Ltd.)
    company_url: ''
    company_logo: ''
    location: Shenzhen, China
    date_start: '2018-07-01'
    date_end: '2018-08-01'
    description: |2-
        Attended the DJI RoboMaster summer camp for high-school students, focused on embedded development. As team captain, led the design and implementation of our solution and finished with a team second prize.

  - title: Individual developer / maker
    company: Middle and high school
    company_url: ''
    company_logo: ''
    location: Guangdong, China
    date_start: '2015-01-01'
    date_end: '2018-08-01'
    description: |2-
        I became fascinated by mechanical and electronic design very early, and taught myself enough to finish several projects on my own — a passion that has never left. Sometimes I feel genuinely lucky to have found a direction I love this early, and that the direction happens to match what the times need.
        * Middle school: built a crane controlled wirelessly by joystick. The Arduino project won second prize on the geekfans website.
        * Grade 10: designed a rig that mounts several infrared probes under a car to detect animals underneath it, transmitting the detections wirelessly to an in-car receiver and display. Second prize at the provincial youth science and technology innovation competition.
        * Grade 11: designed a device that checks whether a rider is wearing a helmet properly, sounding an alarm or disabling the ignition button if not. First prize at the provincial youth science and technology innovation competition.

design:
  columns: '1'
---
