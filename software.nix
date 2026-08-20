{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
  ];

  programs = {
    git.enable = true;
    lazygit.enable = true;

    lazydocker.enable = true;

    superfile.enable = true;
    btop.enable = true;
  };
}
