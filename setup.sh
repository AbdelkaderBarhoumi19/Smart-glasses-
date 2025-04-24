## Sep 2023 update: We've released official support for MediaPipe on Raspberry Pi. 
## It provides many more features to what's available in TFLite Task Library. The guide
## below has been updated to use MediaPipe instead of TFLite Task Library.
## Check out this blog post to learn more:
## https://developers.googleblog.com/2023/08/mediapipe-for-raspberry-pi-and-ios.html

# Show your Raspberry Pi OS version.
cat /etc/os-release

# Update packages on your Raspberry Pi OS.
sudo apt-get update

# Check your Python version. You should have Python 3.8 or later.
python3 --version

# Install virtualenv and upgrade pip.
python3 -m pip install --user --upgrade pip
python3 -m pip install --user virtualenv

# Create a Python virtual environment for the MediaPipe samples (optional but strongly recommended)
python3 -m venv ~/mp

# Run this command whenever you open a new Terminal window/tab to activate the environment.
source ~/mp/bin/activate

# Clone the MediaPipe samples repository with the MediaPipe Raspberry Pi samples.
git clone https://github.com/googlesamples/mediapipe.git
cd mediapipe/examples/object_detection/raspberry_pi

# Install dependencies required by the sample
sh setup.sh

# Run the object detection sample
# **IMPORTANT**: If you SSH to the Pi, make sure that:
#  1. There is a display connected to the Pi.
#  2. Run `export DISPLAY=:0` before proceed to make the object_detection window appear on the display.
python detect.py

####
# If you see an error running the sample:
# ImportError: libcblas.so.3: cannot open shared object file: No such file or directory
# you can fix it by installing an OpenCV dependency that is missing on your Raspberry Pi.
sudo apt-get install libatlas-base-dev