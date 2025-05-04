#!/usr/bin/env python
import os
import sys
import subprocess
import configparser
import shutil
import filecmp

def get_chezmoi_track_dir_path():
    # have to hardcode path because two chezmoi commands cannot run at the same time (apply and source-path)
    return os.path.expanduser("~/.local/share/chezmoi/bootstrap/track")

def get_zen_themes_dir_path():
    zen_profile = os.path.expanduser("~/.var/app/app.zen_browser.zen/.zen")
    zen_profile_ini = os.path.join(zen_profile, "profiles.ini")

    profile = configparser.ConfigParser()
    profile.read(zen_profile_ini)

    try:
        # take only the default profile
        zen_profile_path = os.path.normpath(os.path.join(zen_profile, profile.get("Profile0", "Path")))
    except KeyError:
        print(f"Failed to fetch the default zen profile data", file=sys.stderr)
        return None

    return os.path.join(zen_profile_path, "chrome")

def import_file_if_changed(file_name, chezmoi_dir, zen_dir):
    source_file = os.path.join(chezmoi_dir, file_name)
    destination_file = os.path.join(zen_dir, os.path.basename(source_file))

    if not os.path.isfile(source_file):
        print(f"Missing expected theme file: {source_file}", file=sys.stderr)
        return 1

    if os.path.exists(destination_file) and filecmp.cmp(source_file, destination_file):
        return 2

    shutil.copy(source_file, destination_file)
    print(f"Copied {source_file} to {destination_file}")

    return 0


def main():
    chezmoi_track_dir = get_chezmoi_track_dir_path()
    zen_themes_dir = get_zen_themes_dir_path()

    if chezmoi_track_dir is None or zen_themes_dir is None:
        sys.exit(1)

    if not os.path.exists(chezmoi_track_dir):
        sys.exit(1)

    os.makedirs(zen_themes_dir, exist_ok=True)

    files_to_import = ["userChrome.css", "userContent.css", "zen-logo-mocha.svg"]

    # 0 = changed
    # 1 = error
    # 2 = no change
    status = 2

    for file_name in files_to_import:
        changed = import_file_if_changed(file_name, chezmoi_track_dir, zen_themes_dir)
        if changed == 1:
            status = 1
        elif changed == 0:
            status = 0

    sys.exit(status)

main()
