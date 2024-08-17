let
  tkdu = {buildPythonApplication, setuptools, self'}:
    buildPythonApplication {
      pname = "tkdu";
      #<<< version = builtins.substring 0 8 self'.lastModifiedDate or "dirty";
      #<<< version = self'.dirtyShortRev;
      version = self'.dirtyRev;
      format = "pyproject";

      src = ./.;
      nativeBuildInputs = [ setuptools ];
      doCheck = false;  # TODO: add tests
    };

in 
  {python3, self'}: python3.pkgs.callPackage tkdu { inherit self';}
