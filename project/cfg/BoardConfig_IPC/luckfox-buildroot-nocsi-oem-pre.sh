#!/bin/bash

function lf_rm() {
    for file in "$@"; do
        if [ -e "$file" ]; then
            echo "Deleting: $file"
            rm -rf "$file"  
        #else
            #echo "File not found: $file" 
        fi
    done
}

# remove unused files
function remove_data()
{
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/*.aiisp
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/*.data
    
    # drm
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libdrm*
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libdrm_rockchip*

    # kms
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libkms*

    # freetype
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libfreetype*

    # iconv
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libiconv*

    # rkAVS
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/librkAVS*
    
    # jpeg
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libjpeg*

    # png
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libpng*

    # vqefiles
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/share/vqefiles/*

    # ko - camera/media modules not needed on Mini B
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/phy-rockchip-csi2-dphy-hw.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/phy-rockchip-csi2-dphy.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rga3.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rknpu.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rockit.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc3336.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/video_rkcif.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/video_rkisp.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/mpp_vcodec.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rve.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rk_dvbm.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/motor.ko

    # ko - remove all camera sensor modules
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/imx415.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/os04a10.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc4336.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc530ai.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/gc2053.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc200ai.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc401ai.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc450ai.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/techpoint.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/mis5001.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/mia1321.ko

    # ko - remove WiFi modules (Mini B has no WiFi)
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/cfg80211.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/mac80211.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/r8723bs.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/8723ds.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/8189fs.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/bcmdhd.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/libarc4.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/libaes.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/aic_load_fw.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/aic8800_fdrv.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/atbm6041_wifi_sdio.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/hichannel.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/8188fu.ko

    # ko - remove WiFi insmod script
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/insmod_wifi.sh
    
}

#=========================
# run
#=========================
remove_data