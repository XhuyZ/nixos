{ config, pkgs, ... }:
{
  virtualisation.oci-containers.containers.rabbitmq = {
    image = "rabbitmq:4.0-management";
    ports = [
      "127.0.0.1:5672:5672" # AMQP
      "127.0.0.1:15672:15672" # Web UI
      "127.0.0.1:1883:1883" # MQTT
    ];
    environment = {
      RABBITMQ_DEFAULT_USER = "admin";
      RABBITMQ_DEFAULT_PASS = "admin";
    };
    cmd = [
      "sh"
      "-c"
      "rabbitmq-plugins enable --offline rabbitmq_mqtt && rabbitmq-server"
    ];
  };
}
