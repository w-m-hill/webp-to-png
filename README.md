# Automatic WebP to PNG Converter

This is a simple Bash script that monitors a directory for new .webp image files and converts them to .png format using the `dwebp` command from the webp package. The script can be customized using a configuration file to specify the input and output directories, and whether or not to delete the original .webp files after conversion.

## Installation

1. Clone the repository to your local machine using `git clone https://github.com/yourusername/webp-to-png.git`.

2. Install the `webp` package if it is not already installed on your system. You can do this using your package manager (e.g. `sudo apt-get install webp` on Ubuntu).

3. Customize the script by editing the `config.cfg` file. Set the `INPUT_DIR` and `OUTPUT_DIR` variables to the directories where you want to monitor for new .webp files and save the converted .png files, respectively. Set the `DELETE_WEBP` variable to `true` if you want the original .webp files to be deleted after conversion.

## Usage

To run the script, simply execute the `webp-to-png.sh` file using the command `./webp-to-png.sh &`. The script will monitor the specified input directory for new .webp files and convert them to .png format using the `dwebp` command. The converted .png files will be saved to the specified output directory. If the `DELETE_WEBP` option is set to `true`, the original .webp files will be deleted after conversion.

To run the script automatically in the background on boot create a systemd service or use your distro's gui startup applications program (instructions WIP)

## License

This script is released under the GNU General Public License version 3.0 (GPLv3).

