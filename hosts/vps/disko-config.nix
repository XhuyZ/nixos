{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/sda";

      content = {
        type = "gpt";
        partitions = {

          # EFI SYSTEM PARTITION (UEFI Boot)
          esp = {
            size = "512M";    # chuẩn cho UEFI
            type = "EF00";    # EFI System Partition
            label = "ESP";

            content = {
              type = "filesystem";
              format = "vfat";      # EFI bắt buộc FAT32
              mountpoint = "/boot"; # systemd-boot sẽ đọc ESP tại đây
            };
          };

          # ROOT PARTITION
          root = {
            size = "100%";
            label = "disk-main-root";

            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "noatime"
                "nodiratime"
              ];
            };
          };
        };
      };
    };
  };
}
