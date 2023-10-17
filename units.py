#!/usr/local/bin/python3
# Units Converter Script
# Authors: Kedar Vaijanapurkar, Denis Subbota
# GitHub: https://github.com/kedarvj
# Description: This script converts file sizes between sec, min, hour, bytes, kilobytes, megabytes, gigabytes, and terabytes. 
#              It provides a simple command-line tool for converting and comparing file sizes.
#              Basically this was created to be used as an Alfred Workflow for quick units conversion.
import sys
import datetime

ab = sys.argv[1:]
a_string = "".join(ab)
a = int(a_string)

Hours_from_sec = float(a) / 60 / 60
Hours_from_min = float(a) / 60
days_from_sec = float(a) / 60 / 60 / 24
days_from_min = float(a) / 60 / 24
days_from_hours = float(a) / 24
years_from_hours = float(a)/24/365
dt = datetime.datetime.fromtimestamp(a)

format_strings = [
    " sec = {0:.2f} hours".format(Hours_from_sec),
    " sec = {0:.2f} days".format(days_from_sec),
    " min = {0:.2f} hours".format(Hours_from_min),
    " min = {0:.2f} days".format(days_from_min),
    " hours = {0:.2f} days".format(days_from_hours),
    " hours = {0:.2f} years".format(years_from_hours)
]

for format_str in format_strings:
    print("{0}{1}".format(a, format_str))  # Corrected the print statement

print("----------------------------------------------------------------------------------------------------------------------");
print("Unix time: {} ".format(dt))
print("----------------------------------------------------------------------------------------------------------------------");
MB_from_bytes = float(a) / (1024 ** 2)
GB_from_bytes = float(a) / (1024 ** 3)
TB_from_bytes = float(a) / (1024 ** 4)
GB_from_kb = float(a) / (1024 ** 2)
GB_from_MB = float(a) / 1024
TB_from_MB = float(a) / (1024 ** 3)
TB_from_GB = float(a) / 1024

format_strings = [
    " bytes = {0:.2f} MB".format(MB_from_bytes),
    " bytes = {0:.2f} GB".format(GB_from_bytes),
    " bytes = {0:.2f} TB".format(TB_from_bytes),
    " KB = {0:.2f} GB".format(GB_from_kb),
    " MB = {0:.2f} GB".format(GB_from_MB),
    " MB = {0:.2f} TB".format(TB_from_MB),
    " GB = {0:.2f} TB".format(TB_from_GB)
]

for format_str in format_strings:
    print("{0}{1}".format(a, format_str))
