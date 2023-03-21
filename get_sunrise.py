from astral import LocationInfo
from astral.sun import sun
from datetime import datetime, timedelta
from pytz import timezone
import subprocess
from time import sleep


CONFIG_HOME = "/home/mc/Documents/config"


def replace_in_file(path: str, search: str, by: str):
    content = ""
    with open(path, "r") as f:
        content = f.read()

    content = content.replace(search, by)

    with open(path, "w") as f:
        f.write(content)


def set_light():
    print("setting theme to light mode")
    replace_in_file(
        f"{CONFIG_HOME}/alacritty/alacritty.yml", "base16-helios-256", "latte"
    )
    replace_in_file(f"{CONFIG_HOME}/bat/config", "", '--theme="OneHalfLight"')
    replace_in_file(f"{CONFIG_HOME}/nvim/lua/plugins/colorscheme.lua", "mocha", "latte")


def set_dark():
    print("setting theme to dark mode")
    replace_in_file(f"{CONFIG_HOME}/alacritty/alacritty.yml", "latte", "mocha")
    replace_in_file(f"{CONFIG_HOME}/bat/config", '--theme="OneHalfLight"', "")
    replace_in_file(
        f"{CONFIG_HOME}/nvim/lua/plugins/colorscheme.lua", "latte", "base16-helios-256"
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
    if sun_today["sunrise"] <= current_time and current_time < sun_today["dusk"]:
        subprocess.run(
            ["gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", "Pop"]
        )
        subprocess.run(
            [
                "gsettings",
                "set",
                "org.gnome.desktop.interface",
                "color-scheme",
                "prefer-light",
            ]
        )
        secs_til_dusk = (sun_today["dusk"] - current_time).seconds
        set_light()
        print(f"sleep for {secs_til_dusk}")
        sleep(secs_til_dusk)
    else:
        subprocess.run(
            ["gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", "Pop-dark"]
        )
        subprocess.run(
            [
                "gsettings",
                "set",
                "org.gnome.desktop.interface",
                "color-scheme",
                "prefer-dark",
            ]
        )
        set_dark()
        if current_time.hour < 12:
            secs_til_sunrise = (sun_today["sunrise"] - current_time).seconds
            print(f"sleep for {secs_til_sunrise}")
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
            secs_til_sunrise = (sun_tmrw["sunrise"] - current_time).seconds
            print(f"sleep for {secs_til_sunrise}")
            sleep(secs_til_sunrise)
