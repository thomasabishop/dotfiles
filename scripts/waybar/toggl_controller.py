#! /usr/local/bin/python3
import requests
import os
from textwrap import dedent
import logging
import base64
import json
import pytz
from datetime import datetime, timedelta
from tabulate import tabulate  # third-party module, must be installed on system


TOGGL_API_URL = "https://api.track.toggl.com/api/v9/"
TOGGL_API_KEY = os.getenv("TOGGL_API_KEY")
TOGGL_WORKSPACE_ID = os.getenv("TOGGL_WORKSPACE_ID")
ENCODED_TOGGL_API_KEY = str(base64.b64encode(TOGGL_API_KEY.encode("utf-8")), "utf-8")
HEADERS = {
    "content-type": "application/json",
    "Authorization": "Basic %s" % ENCODED_TOGGL_API_KEY,
}


def get_data(endpoint):
    response = requests.get(
        f"https://api.track.toggl.com/api/v9/{endpoint}",
        headers={
            "content-type": "application/json",
            "Authorization": "Basic %s" % ENCODED_TOGGL_API_KEY,
        },
    )
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(
            f"Failed to fetch data from API. Status code: {response.status_code}"
        )


def get_project_name(project_id: int) -> str:
    try:
        projects = get_data(f"workspaces/{TOGGL_WORKSPACE_ID}/projects")
        project = [project for project in projects if project["id"] == project_id][0]
        return project["name"]
    except Exception as e:
        logging.warning(f"Error. Could not retrieve project name: {e}")


def get_human_date(timestamp):
    return datetime.strptime(timestamp, "%Y-%m-%dT%H:%M:%S%z").strftime(
        "%a %d %b (%H:%M)"
    )


def get_time_difference(start, end):
    format = "%Y-%m-%dT%H:%M:%S%z"
    datetime1 = datetime.strptime(start, format)
    datetime2 = datetime.strptime(end, format)
    difference = datetime2 - datetime1
    return get_hms(int(difference.total_seconds()))


def get_hms(unix_seconds):
    return str(timedelta(seconds=unix_seconds))


def timer_is_running():
    active_session = get_data("me/time_entries/current")
    if not active_session:
        return False
    else:
        return True


# def get_active_time_entry():
#     active_session = get_data("me/time_entries/current")
#     if not active_session:
#         return "No timer running"
#     else:
#         current_time = datetime.now(pytz.utc).strftime("%Y-%m-%dT%H:%M:%S%z")
#         entry = {
#             "project_id": get_project_name(active_session["project_id"]),
#             "duration": get_time_difference(active_session["start"], current_time),
#             "start": get_human_date(active_session["start"]),
#             "description": active_session["description"],
#         }
#         return print_table([entry])


def process_active_entry(entry):
    time_now = datetime.now(pytz.utc).strftime("%Y-%m-%dT%H:%M:%S%z")
    return {
        "project_id": get_project_name(entry["project_id"]),
        "duration": get_time_difference(entry["start"], time_now),
        "start": get_human_date(entry["start"]),
        "description": entry["description"],
    }


def list_recent_time_entries():
    try:
        recent_entries = get_data("me/time_entries")
        properties = ["project_id", "duration", "start", "description"]
        transformers = {
            "project_id": get_project_name,
            "start": get_human_date,
            "duration": get_hms,
        }
        processed_entries = []
        first_entry = recent_entries[0]
        if not first_entry["stop"]:
            active_entry = process_active_entry(first_entry)
            print(active_entry)
        for entry in recent_entries[:5]:
            processed_entry = {}
            for prop in properties:
                if prop in transformers:
                    processed_entry[prop] = transformers[prop](entry[prop]) or "null"
                else:
                    processed_entry[prop] = entry[prop] or "null"
            processed_entries.append(processed_entry)
        processed_entries[0] = active_entry
        return dedent(
            tabulate(processed_entries, headers="keys", tablefmt="simple_outline")
        )

    except Exception as e:
        return f"Error. Could not retrieve recent time entries: {e}"


def stop_running_timer(entry_id):
    patch_url = (
        f"{TOGGL_API_URL}workspaces/{TOGGL_WORKSPACE_ID}/time_entries/{entry_id}/stop"
    )
    response = requests.patch(patch_url, headers=HEADERS)
    if response.status_code != 200:
        print("Error: timer not stopped")
        print(response.content)
    else:
        return


def main():
    output = {}
    try:
        if timer_is_running():
            output["text"] = " Tracker: active"
            output["class"] = "active"
        else:
            output["text"] = " Tracker: inactive"
            output["class"] = "inactive"
        output["tooltip"] = list_recent_time_entries()
    except Exception as e:
        output["text"] = "Error"

    print(json.dumps(output))


if __name__ == "__main__":
    main()

print(list_recent_time_entries())
# print(get_project_name(193325937))
# print(list_recent_time_entries())
# print(get_active_time_entry())
# print(get_active_session())
# stop_running_timer(3318296941)
