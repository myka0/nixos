{
  pkgs,
  lib,
  ...
}: let
  templateDir = "${pkgs.kicad.base}/share/kicad/template";
in {
  home = {
    packages = [pkgs.kicad];

    # Re-point KiCad's stock library tables at the installed version each switch
    activation.kicadLibraries =
      lib.hm.dag.entryAfter ["writeBoundary"]
      ''
        _kicadTemplate=${lib.escapeShellArg templateDir}

        for _table in "$HOME"/.config/kicad/*/sym-lib-table \
                      "$HOME"/.config/kicad/*/fp-lib-table \
                      "$HOME"/.config/kicad/*/design-block-lib-table; do
          [ -f "$_table" ] || continue

          if ${pkgs.gnugrep}/bin/grep -qE \
            '/nix/store/[a-z0-9]+-kicad-base-[^/]+/share/kicad/template' "$_table"; then
            ${pkgs.gnused}/bin/sed -i -E \
              "s#/nix/store/[a-z0-9]+-kicad-base-[^/]+/share/kicad/template#$_kicadTemplate#g" \
              "$_table"
          fi

          case "$_table" in
            */design-block-lib-table)
              if ! [ -e "$_kicadTemplate/design-block-lib-table" ] &&
                ${pkgs.gnugrep}/bin/grep -q 'name "KiCad") (type "Table")' "$_table"; then
                ${pkgs.gnugrep}/bin/grep -v 'name "KiCad") (type "Table")' "$_table" >"$_table.tmp" &&
                  ${pkgs.coreutils}/bin/mv "$_table.tmp" "$_table" ||
                  ${pkgs.coreutils}/bin/rm -f "$_table.tmp"
              fi
              ;;
          esac
        done
      '';
  };
}
