{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/sda";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1M";
            type = "EF02";
          };

          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              label = "nixos-root";   # filesystem label (CHUẨN)
              mountpoint = "/";
              mountOptions = [ "noatime" "nodiratime" "discard" ];
            };
          };
        };
      };
    };
  };
}
