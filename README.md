# Automatic WebP to PNG Converter

This is a simple Bash script that monitors a directory for new .webp image files and converts them to .png format using the `dwebp` command from the webp package. The script can be customized using the config file to specify the input and output directories, and whether or not to delete the original .webp files after conversion.

You can set the input and output directories to your downloads folder and set `DELETE_WEBP` to `true` to essentially override Google Images' annoying tendencey to download images as webps. 

## Installation

1. Clone the repository to your local machine using `git clone https://github.com/w-m-hill/webp-to-png`.

2. Install the `webp` and `inotify-tools` packages if they are not already installed on your system. (`sudo apt install webp inotify-tools` on Ubuntu).

3. Customize the script by editing the `config.cfg` file. Set the `INPUT_DIR` and `OUTPUT_DIR` variables to the directories where you want to monitor for new .webp files and save the converted .png files, respectively. Set the `DELETE_WEBP` variable to `true` if you want the original .webp files to be deleted after conversion.

## Usage

To use the script, make it executable by running `chmod +x webp-to-png.sh`, then run the script in the background using `./webp-to-png.sh &`. 

To run the script automatically on boot create a systemd service or use your distro's gui startup applications program (detailed instructions WIP)

## License

This script is released under the GNU General Public License version 3.0 (GPLv3).

