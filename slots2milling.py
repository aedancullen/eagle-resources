# Fusion 360 Electronics .brd modification script for slotted pad compatibility with legacy EAGLE
# Copyright (c) 2023 Aedan Cullen <aedan@aedancullen.com>
# SPDX-License-Identifier: GPL-3.0-or-later

import os
import sys
import math

def parse_segment(ls, idx):
    segment = ls[idx].split("=")[1]
    return "".join(c for c in segment if c not in ['"', '/', '>'])

seen_layers = set(sys.argv[2].split(","))
print(seen_layers)

infile = open(sys.argv[1], "r")
outfile = open("slots2milling_" + sys.argv[1], "wt")
line = infile.readline()

new_lines = []

while line != "":

    if line.startswith("<pad") and "slot" in line:
        print(line.strip())
        ls = line.split(" ")
        name = parse_segment(ls, 1)
        x = float(parse_segment(ls, 2))
        y = float(parse_segment(ls, 3))
        drill = float(parse_segment(ls, 4))
        diameter = float(parse_segment(ls, 5))
        slotLength = float(parse_segment(ls, 6))
        rot = int(parse_segment(ls, 8)[1:]) if "rot" in line else 0
        print(x, y, drill, diameter, slotLength, rot)

        rot_rad = rot * (2*math.pi/360)
        mill_len = (slotLength/2 - drill/2)
        x1 = x + mill_len*math.cos(rot_rad)
        y1 = y + mill_len*math.sin(rot_rad)
        x2 = x - mill_len*math.cos(rot_rad)
        y2 = y - mill_len*math.sin(rot_rad)
        print(x1, y1, x2, y2)

        outfile.write(f"""<wire x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" width="{drill}" layer="46"/>\n""")
        outfile.write(f"""<pad name="{name}" x="{x}" y="{y}" drill="{drill}" diameter="{diameter}"/>\n""")
        for layer in seen_layers:
            outfile.write(f"""<wire x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" width="{diameter}" layer="{layer}"/>\n""")

        line = infile.readline()

    else:
        outfile.write(str(line))
        line = infile.readline()

infile.close()
outfile.close()
