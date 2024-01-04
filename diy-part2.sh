#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
wget -O /tmp/reinstall_istore.sh https://cdn.jsdelivr.net/gh/wukongdaily/commonscript/common/reinstall_istore.sh && chmod +x /tmp/reinstall_istore.sh  && /tmp/reinstall_istore.sh

