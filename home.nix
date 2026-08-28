{ hermes-agent, lib, enableHermes ? false, ... }:

{
  home.username = "kaz";
  home.homeDirectory = "/home/kaz";
  home.stateVersion = "26.05";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  imports = [
    ./software.nix
    ./neovim.nix
  ]
  ++ lib.optionals enableHermes [
    ./hermes.nix
    hermes-agent.homeManagerModules.default
  ];
}
