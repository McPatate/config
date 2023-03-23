import os
from astral import LocationInfo
from astral.sun import sun
from datetime import datetime, timedelta
from pathlib import Path
from pytz import timezone
import subprocess
import sys
from time import sleep


CONFIG_HOME = "/home/mc/Documents/config"
CONFIG_TARGET = "/home/mc/.config"


def replace_in_file(path: str, search: str, by: str):
    content = ""
    with open(path, "r") as f:
        content = f.read()

    content = content.replace(search, by)

    with open(path, "w") as f:
        f.write(content)


def set_light():
    print("setting theme to light mode")
    sys.stdout.flush()
    subprocess.run(
        ["gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", ";'Pop'"]
    )
    subprocess.run(
        [
            "gsettings",
            "set",
            "org.gnome.desktop.interface",
            "color-scheme",
            "'prefer-light'",
        ]
    )
    replace_in_file(
        f"{CONFIG_HOME}/alacritty/alacritty.yml",
        "base16-helios-256",
        "catppuccin-latte",
    )
    replace_in_file(f"{CONFIG_HOME}/bat/config", "ansi", "OneHalfLight")
    replace_in_file(f"{CONFIG_HOME}/nvim/lua/plugins/colorscheme.lua", "mocha", "latte")
    Path(f"{CONFIG_TARGET}/k9s/skin.yml").unlink(missing_ok=True)
    os.symlink(f"{CONFIG_HOME}/k9s/latte.yml", f"{CONFIG_TARGET}/k9s/skin.yml")
    replace_in_file(
        f"{CONFIG_HOME}/git/.gitconfig-linux", "light = false", "light = true"
    )
    replace_in_file(
        f"{CONFIG_HOME}/lazygit/config.yml", "ansi", "OneHalfLight"
    )


def set_dark():
    print("setting theme to dark mode")
    sys.stdout.flush()
    subprocess.run(
        ["gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", "'Pop-dark'"]
    )
    subprocess.run(
        [
            "gsettings",
            "set",
            "org.gnome.desktop.interface",
            "color-scheme",
            "'prefer-dark'",
        ]
    )
    replace_in_file(
        f"{CONFIG_HOME}/alacritty/alacritty.yml",
        "catppuccin-latte",
        "base16-helios-256",
    )
    replace_in_file(f"{CONFIG_HOME}/bat/config", "OneHalfLight", "ansi")
    replace_in_file(f"{CONFIG_HOME}/nvim/lua/plugins/colorscheme.lua", "latte", "mocha")
    Path(f"{CONFIG_TARGET}/k9s/skin.yml").unlink(missing_ok=True)
    os.symlink(f"{CONFIG_HOME}/k9s/mocha.yml", f"{CONFIG_TARGET}/k9s/skin.yml")
    replace_in_file(
        f"{CONFIG_HOME}/git/.gitconfig-linux", "light = true", "light = false"
    )
    replace_in_file(
        f"{CONFIG_HOME}/lazygit/config.yml", "OneHalfLight", "ansi"
    )


timezone_label = "Europe/Paris"
city = LocationInfo("Lyon", "France", timezone_label, 45.764, 4.8357)
print(
    (
        f"Information for {city.name}/{city.region}\n"
        f"Timezone: {city.timezone}\n"
        f"Latitude: {city.latitude:.02f}; Longitude: {city.longitude:.02f}\n"
    )
)
sys.stdout.flush()

while True:
    tz = timezone(timezone_label)
    current_time = datetime.now(tz=tz)
    sun_today = sun(city.observer, date=current_time, tzinfo=tz)
    print(
        (
            "Today's sun info :\n"
            f'Dawn:    {sun_today["dawn"]}\n'
            f'Sunrise: {sun_today["sunrise"]}\n'
            f'Noon:    {sun_today["noon"]}\n'
            f'Sunset:  {sun_today["sunset"]}\n'
            f'Dusk:    {sun_today["dusk"]}\n'
        )
    )
    sys.stdout.flush()
    if sun_today["sunrise"] <= current_time and current_time < sun_today["sunset"]:
        set_light()
        secs_til_sunset = (sun_today["sunset"] - current_time).seconds
        print(f"sleep for {secs_til_sunset}")
        sys.stdout.flush()
        sleep(secs_til_sunset)
    else:
        set_dark()
        if current_time.hour < 12:
            secs_til_sunrise = (sun_today["sunrise"] - current_time).seconds
            print(f"sleep for {secs_til_sunrise}")
            sys.stdout.flush()
            sleep(secs_til_sunrise)
        else:
            sun_tmrw = sun(
                city.observer, date=current_time + timedelta(days=1), tzinfo=tz
            )
            print(
                (
                    "Tomorrow's sun info :\n"
                    f'Dawn:    {sun_today["dawn"]}\n'
                    f'Sunrise: {sun_today["sunrise"]}\n'
                    f'Noon:    {sun_today["noon"]}\n'
                    f'Sunset:  {sun_today["sunset"]}\n'
                    f'Dusk:    {sun_today["dusk"]}\n'
                )
            )
            sys.stdout.flush()
            secs_til_sunrise = (sun_tmrw["sunrise"] - current_time).seconds
            print(f"sleep for {secs_til_sunrise}")
            sys.stdout.flush()
            sleep(secs_til_sunrise)
