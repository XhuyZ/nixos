{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/vda"; # CHANGE ME
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for GRUB MBR
              priority = 1;
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = ["noatime" "nodiratime" "discard"];
              };
            };
          };
        };
      };
    };
  };
}

