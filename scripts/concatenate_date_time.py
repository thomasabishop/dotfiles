#! /usr/local/bin/python3

import os
import sys
import csv
from datetime import datetime


def get_file_size(file_path):
    stats = os.stat(file_path)
    return stats.st_size


def seconds_to_digital_time(seconds):
    hours = seconds / 3600
    return round(hours, 2)


def convert_to_utc(date: str, time: str) -> str:
    datetime_obj = datetime.strptime(f"{date} {time}", "%Y-%m-%d %H:%M:%S")
    utc_string = datetime_obj.strftime("%Y%m%dT%H%M%SZ")
    return utc_string


def calculate_decimal_duration(utc1, utc2):
    utc1_object = datetime.strptime(utc1, "%Y%m%dT%H%M%SZ")
    utc2_object = datetime.strptime(utc2, "%Y%m%dT%H%M%SZ")

    time_difference = utc2_object - utc1_object
    difference_seconds = time_difference.total_seconds()
    return seconds_to_digital_time(difference_seconds)


if __name__ == "__main__":
    path = sys.argv[1]
    updated_rows = []
    with open(path, mode="r") as csv_file:
        reader = csv.DictReader(csv_file)
        line = 0
        for row in reader:
            if line > 0:
                start = convert_to_utc(row["start_date"], row["start_time"])
                end = convert_to_utc(row["end_date"], row["end_time"])
                duration = calculate_decimal_duration(start, end)
                updated_rows.append(
                    [row["activity"], start, end, duration, row["description"]]
                )
            line += 1
    with open("updated.csv", mode="w") as updated_file:
        writer = csv.writer(updated_file)
        for element in updated_rows:
            writer.writerow(element)
    file_size = get_file_size("./updated.csv")
    print(f"Wrote data to new file. Name: updated.csv. Size: {file_size} bytes")
