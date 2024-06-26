#! /usr/local/bin/python3
import requests
import os
import json
import textwrap

WAKATIME_API_KEY = os.getenv("WAKATIME_API_KEY")
WAKATIME_ENDPOINT = "https://wakatime.com/api/v1/users/current/status_bar/today"


class DataPending(Exception):
    """Raised when the data is pending or not yet available"""

    pass


def get_data(url):
    try:
        response = requests.get(url, timeout=5)

    except requests.exceptions.Timeout:
        raise DataPending("Request timed out. Data may be pending.")
    except requests.exceptions.RequestException as e:
        raise Exception("Could not fetch data.")

    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(
            f"Failed to fetch data from API. Status code: {response.status_code}"
        )


def generate_tooltip(time, languages, projects):
    return textwrap.dedent(
        f"""\
        Time coding: {time}
        Languages: {languages}
        Projects: {projects}"""
    )


def format_metric(metrics):
    return ", ".join(
        [f'{metric["name"]} ({metric["percent"]}%)' for metric in metrics[:3]]
    )


def main():
    output = {}
    try:
        data = get_data(WAKATIME_ENDPOINT + "?api_key=" + WAKATIME_API_KEY)
        digital_time = data["data"]["grand_total"]["digital"]
        human_time = data["data"]["grand_total"]["text"]
        langs = data["data"]["languages"]
        projects = data["data"]["projects"]
        tooltip = generate_tooltip(
            human_time, format_metric(langs), format_metric(projects)
        )
        output["text"] = digital_time
        output["tooltip"] = tooltip

    except DataPending as e:
        output["text"] = "Pending"
    except Exception as e:
        output["text"] = "Error"

    print(json.dumps(output))


if __name__ == "__main__":
    main()
