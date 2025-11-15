{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; 
              label = "disk-main-boot";
            };

            root = {
              size = "100%";
              label = "disk-main-root"; 
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [ "noatime" "nodiratime" "discard" ];
              };
            };
          };
        };
      };
    };
  };
}
