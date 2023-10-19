#!/usr/bin/env python3
from datetime import datetime

currenthour = datetime.now().hour

if currenthour in [12, 0]:
    print("󱑖")
if currenthour in [11, 23]:
    print("󱑕")
if currenthour in [10, 22]:
    print("󱑔")
if currenthour in [9, 21]:
    print("󱑓")
if currenthour in [8, 20]:
    print("󱑒")
if currenthour in [7, 19]:
    print("󱑑")
if currenthour in [6, 18]:
    print("󱑐")
if currenthour in [5, 17]:
    print("󱑏")
if currenthour in [4, 16]:
    print("󱑎")
if currenthour in [3, 15]:
    print("󱑍")
if currenthour in [2, 14]:
    print("󱑌")
if currenthour in [1, 13]:
    print("󱑋")
