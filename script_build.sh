#!/bin/bash

# Clone this script in your ROM Repo using following commands.
# cd rom_repo
# curl https://raw.githubusercontent.com/Butti15/Scripts-Serber/master/script_build.sh > script_build.sh

username=prashant

# colors
export TERM=xterm

    red=$(tput setaf 1) # red
    grn=$(tput setaf 2) # green
    blu=$(tput setaf 4) # blue
    cya=$(tput setaf 6) # cyan
    txtrst=$(tput sgr0) # Reset

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/prashant/ccache
prebuilts/misc/linux-x86/ccache/ccache -M 50G
export KBUILD_BUILD_USER=Butti
export KBUILD_BUILD_HOST=Kaizz

# clean
make clean && make clobber
echo -e ${cya}"OUT dir from your repo deleted"${txtrst};

# build
export LC_ALL=C
. build/envsetup.sh
lunch du_tomato-userdebug
make bacon -j8
