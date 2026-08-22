{ hermes-agent, ... }:

{
  home.username = "kaz";
  home.homeDirectory = "/home/kaz";
  home.stateVersion = "26.05";

  imports = [
    ./software.nix
    ./neovim.nix
    ./hermes.nix
    hermes-agent.homeManagerModules.default
  ];
}
