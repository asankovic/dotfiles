#!/usr/bin/env python
import os
import sys
import subprocess
import configparser
import shutil

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

def import_file(file_name, chezmoi_dir, zen_dir):
    source_file = os.path.join(chezmoi_dir, file_name)
    destination_file = os.path.join(zen_dir, os.path.basename(source_file))

    if os.path.isfile(source_file):
        shutil.copy(source_file, destination_file)
        print(f"Copied {source_file} to {destination_file}")
    else:
        print(f"Missing expected theme file: {source_file}", file=sys.stderr)


def main():
    chezmoi_track_dir = get_chezmoi_track_dir_path()
    zen_themes_dir = get_zen_themes_dir_path()

    if chezmoi_track_dir is None or zen_themes_dir is None:
        sys.exit(1)

    if not os.path.exists(chezmoi_track_dir):
        sys.exit(1)

    os.makedirs(zen_themes_dir, exist_ok=True)

    files_to_import = ["userChrome.css", "userContent.css", "zen-logo-mocha.svg"]

    for file_name in files_to_import:
        import_file(file_name, chezmoi_track_dir, zen_themes_dir)

main()
