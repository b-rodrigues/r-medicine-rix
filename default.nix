let
 pkgs = import (fetchTarball "https://github.com/rstats-on-nix/nixpkgs/archive/2025-03-03.tar.gz") {};
  rix = [(pkgs.rPackages.buildRPackage {
            name = "rix";
            src = pkgs.fetchgit {
             url = "https://github.com/ropensci/rix/";
             rev = "864a630ffe79c355734bc7e08e6dd8ddbeb92ee6";
             sha256 = "sha256-zpDiSEOUI3Iy7r8uyedXmr7+Ej+2MPiCfFYlQrbKSaI=";
            };
            propagatedBuildInputs = builtins.attrValues {
              inherit (pkgs.rPackages) codetools httr jsonlite sys;
            };
         })
  ];
 system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocalesUtf8 quarto nix;
};
 r_pkgs = builtins.attrValues {
  inherit (pkgs.rPackages) quarto targets tarchetypes withr;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [ system_packages rix r_pkgs ];

  }

