{ config, ... }: {
  virtualisation.oci-containers.containers."webvirtcloud" = {
    image = "webvirtcloud:latest";
    autoStart = true;

    ports = [
      "0.0.0.0:80:80"
      "0.0.0.0:6080:6080"
    ];

    environment = {
      TZ = "UTC";
      # SECRET_KEY = "your-custom-secret-key-here";
      # CSRF_TRUSTED_ORIGINS = "http://localhost,http://127.0.0.1";
    };

    volumes = [
      "/var/lib/webvirtcloud/data:/srv/webvirtcloud/data"
      "/var/lib/webvirtcloud/ssh:/var/www/.ssh"
    ];

    extraOptions = [
      "--restart=unless-stopped"
    ];
  };
}
