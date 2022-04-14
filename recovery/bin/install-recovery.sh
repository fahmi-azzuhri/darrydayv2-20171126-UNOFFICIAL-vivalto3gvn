#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 6807552 e576c59ec6c9703347fd28732dea576f0dc29d3b 4593664 a515ce159b69cecb7715aefe45650ee0ba9582be
fi

if ! applypatch -c EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY:6807552:e576c59ec6c9703347fd28732dea576f0dc29d3b; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sprd-sdhci.3/by-name/KERNEL:4593664:a515ce159b69cecb7715aefe45650ee0ba9582be EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY e576c59ec6c9703347fd28732dea576f0dc29d3b 6807552 a515ce159b69cecb7715aefe45650ee0ba9582be:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
