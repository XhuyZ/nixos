{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";

        content = {
          type = "gpt";

          # GPT PARTITIONS
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
              label = "disk-main-boot";
            };

            root = {
              size = "100%";
              label = "disk-main-root";  # ⬅ label đặt tại đây (đúng chỗ)
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [
                  "noatime"
                  "nodiratime"
                  "discard"
                ];
              };
            };
          };
        };
      };
    };
  };
}
