{ config, ... }: {
  virtualisation.podman.enable = true;
  virtualisation.oci-containers.backend = "podman";

  virtualisation.oci-containers.containers."webvirtcloud" = {
    image = "webvirtcloud:latest";
    autoStart = true;

    ports = [
      "80:80"
      "6080:6080"
    ];

    environment = {
      TZ = "Asia/Ho_Chi_Minh";
    };

    volumes = [
      "/var/lib/webvirtcloud/data:/srv/webvirtcloud/data"
      "/var/lib/webvirtcloud/ssh:/var/www/.ssh"
    ];
  };
}
