{ pkgs }:

pkgs.stdenv.mkDerivation {
	name = "Material-gtk-themes";
  src = pkgs.fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      rev = "master";
      repo = "Material-GTK-Themes";
      hash = "sha256-2E+ZRnvqzzS986J0ckrV73J1YqMUodj8bVXVStxcfUg=";
    };
	dontUnpack = true;

	installPhase = ''
    mkdir -p $out/share/
    cp -r $src/themes/ $out/share/themes/
    cp -r $src/icons/ $out/share/icons/
	'';
}
