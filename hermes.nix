{
  services.hermes-agent = {
    enable = true;
    installPackage = true;

    gateway.enable = true;
    extraDependencyGroups = [
      "messaging"
      "voice"
      "edge-tts"
    ];

    settings = {
      approvals.mode = "smart";

      platforms.whatsapp.extra.bridge_port = 3030;

      security = {
        redact_secrets = true;
        tirith_enabled = true;
      };
    };
  };
}
