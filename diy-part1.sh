#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# name: 替换默认主题 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argonv3/' feeds/luci/collections/luci/Makefile

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#定时任务软件源
#git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset

# 默认ip 192.168.6.1
sed -i 's/192.168.[0-9]\{1,3\}.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 修改时区 UTF-8
sed -i 's/UTC/CST-8/g'  package/base-files/files/bin/config_generate

# 修改主机名 OP
sed -i 's/ImmortalWrt/ASUSWRT/g'  package/base-files/files/bin/config_generate

# 时区
sed -i 's/time1.apple.com/time1.cloud.tencent.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time1.google.com/ntp.aliyun.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time.cloudflare.com/cn.ntp.org.cn/g'  package/base-files/files/bin/config_generate
sed -i 's/pool.ntp.org/cn.pool.ntp.org/g'  package/base-files/files/bin/config_generate

# Tcp和内存调度优化
echo 'fs.file-max = 2097152' >>package/base-files/files/etc/sysctl.conf
echo 'fs.nr_open = 2097152' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.netdev_max_backlog = 5000' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_max = 65536' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_established = 300' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_syn_recv = 20' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 20' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_time_wait = 20' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_close = 10' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_last_ack = 20' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_udp_timeout = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_udp_timeout_stream = 60' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_frag6_high_thresh = 262144' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_frag6_low_thresh = 196608' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_forward = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_slow_start_after_idle = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_syn_retries = 2' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_synack_retries = 2' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_max_syn_backlog = 4096' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_timestamps = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_low_latency = 1' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_rmem = 4096 87380 8388608' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_wmem = 4096 65536 8388608' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.flush = 1' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_local_port_range = 1024 65535' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_mem = 393216 1048576 1572864' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.all.rp_filter = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.default.rp_filter = 0' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_stale_time = 60' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_thresh1 = 1024' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_thresh2 = 2048' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_thresh3 = 4096' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.somaxconn = 8192' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.rmem_max = 16777216' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.wmem_max = 16777216' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.rmem_default = 16777216' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.wmem_default = 16777216' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_rmem_min = 8192' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_wmem_min = 8192' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_mem = 32768 65536 131072' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_no_pmtu_disc = 0' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_high_thresh = 2097152' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_low_thresh = 1572864' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_time = 20' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_max_dist = 64' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_secret_interval = 300' >>package/base-files/files/etc/sysctl.conf

# 替换源 
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g'  package/emortal/default-settings/files/99-default-settings-chinese

# Do not be evil # ae6ff34105444482cc3d46d43987cc467ea79ac7
# LANG=C sed -i ':label;N;s/^[\x81-\xFE][\x40-\xFE].*\n//g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
# cat target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
