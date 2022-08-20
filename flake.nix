{ inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
         { packages =
             (import ./.  { pkgs = import ./pinned.nix { inherit system; }; }).inputs;
         }
      );
}
