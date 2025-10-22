# Catclock (Uxn)

A tiny analog cat clock for the [Uxn](https://100r.co/site/uxn.html) virtual machine.  
This repository packages the original source from [https://wiki.xxiivv.com/etc/catclock.tal.txt](https://wiki.xxiivv.com/etc/catclock.tal.txt) for easy building and execution.

## Build

- With `uxnasm` installed:
  - `uxnasm catclock.tal catclock.rom`

## Run

- With `uxnemu` installed:
  - `uxnemu catclock.rom`

## Optional theme

Catclock will try to read a file named `.theme` in the current working directory and set the background color via the System device.  
The file format is three 16-bit big-endian values (R, G, B), read in order.

- Example (bash) to write a light theme:
  - `printf '\xF0\xFF\xF0\xF0\xF0\xF0' > .theme`

Remove `.theme` to revert to the default theme.

## Credits

- Original source: [https://wiki.xxiivv.com/etc/catclock.tal.txt](https://wiki.xxiivv.com/etc/catclock.tal.txt)
- Author: Hundred Rabbits / XXiivv  
- This repository only repackages the TAL file to simplify building and running with `uxnasm` and `uxnemu`.

## Notes

- Tested with current `uxnasm`/`uxnemu` builds.
- If your window is small, set `Screen/width` and `Screen/height` in your UXN environment or scale in `uxnemu`.

