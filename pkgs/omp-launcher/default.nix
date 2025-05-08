{ pkgs }:
pkgs.rustPlatform.buildRustPackage rec {
  # . . .

  pname = "omp-launcher";
  version   = "1.5.2";
  src = pkgs.fetchFromGitHub {
    owner = "openmultiplayer";
    repo = "launcher";
    rev = "v${version}";
    hash = "sha256-UmE82AK82yHmno0f1SSvT7wmcoioFYvpuNPDMuCsuB0=";
  }; 
  cargoRoot = "src-tauri";
  cargoHash = "sha256-aem/IbSniNCnbNoZ/JuCLgxm+aQge4MuByFMzutmDPs=";
  # Assuming our app's frontend uses `npm` as a package manager

    yarnOfflineCache = pkgs.fetchYarnDeps {
    yarnLock = "${src}/yarn.lock";
    hash = "sha256-hVWDidAGeuggZt3PWfXstakj56zw3FawUFp1o2LT6X0=";
  };

    useFetchCargoVendor = true;

  nativeBuildInputs =  with pkgs;[
    webkitgtk_4_0
    yarnConfigHook
    yarnBuildHook
    yarnInstallHook
    # Pull in our main hook
    cargo-tauri.hook
    # Setup npm
    nodejs

    # Make sure we can find our libraries
    pkg-config
    libsoup_2_4
    wrapGAppsHook3
  ];
    

  buildInputs = with pkgs;
    [ openssl 
    webkitgtk_4_0
    libsoup_2_4
    ]
    ++ pkgs.lib.optionals stdenv.hostPlatform.isLinux [
      glib-networking # Most Tauri apps need networking
    ];

  # Set our Tauri source directory
  # And make sure we build there too
  buildAndTestSubdir = cargoRoot;

  # . . .
}
