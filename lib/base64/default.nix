{ inputs }:
let
  inherit (inputs.nixpkgs.lib)
    concatLists
    concatMapStrings
    foldl'
    genList
    hasSuffix
    imap0
    length
    mod
    nameValuePair
    stringToCharacters
    sublist
    substring
    take
    ;
in
rec {
  base64Table = builtins.listToAttrs (
    imap0 (i: c: nameValuePair c i) (
      # The '=' is included so the main algorithm doesn't fail before we can trim the result
      stringToCharacters "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
    )
  );

  # Generated using python3:
  # print(''.join([ chr(n) for n in range(1, 256) ]), file=open('ascii', 'w'))
  ascii = builtins.readFile ./ascii;

  decode =
    str:
    let
      paddingCount =
        if hasSuffix "==" str then
          2
        else if hasSuffix "=" str then
          1
        else
          0;

      numbers64 = map (c: base64Table.${c}) (stringToCharacters str);

      allBytes = concatLists (
        genList (
          i:
          let
            v = foldl' (acc: el: acc * 64 + el) 0 (sublist (i * 4) 4 numbers64);
          in
          [
            (mod (v / 256 / 256) 256)
            (mod (v / 256) 256)
            (mod v 256)
          ]
        ) (length numbers64 / 4)
      );

      finalBytes = take (length allBytes - paddingCount) allBytes;

    in
    concatMapStrings (n: substring (n - 1) 1 ascii) finalBytes;
}
