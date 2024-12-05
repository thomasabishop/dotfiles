#! /usr/local/bin/python3

import json
import subprocess


def invoke_shell(proc):
    try:
        result = subprocess.run(
            proc,
            shell=True,
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        return e.stderr.strip()


def timer_active() -> bool:
    status = invoke_shell("timew get dom.active")
    if status == "1":
        return True
    else:
        return False


def generate_tooltip():
    tooltip = invoke_shell("timew summary :week")
    return tooltip


def main():
    output = {}
    try:
        if timer_active():
            output["text"] = "Timer running"
            output["class"] = "active"
            print("Time Warrior: ACTIVE")
        else:
            output["text"] = ""
            output["class"] = "inactive"
            print("Time Warrior: IDLE")
    except Exception as e:
        output["text"] = "Error"

    # print(output["text"])
    # print(json.dumps(output))


if __name__ == "__main__":
    main()
