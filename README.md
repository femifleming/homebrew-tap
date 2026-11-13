# femifleming/tap

One Homebrew tap for all of Femi Fleming's instruments, effects and tools. Each project still lives in its own repo; this is just the one place to install them from.

## Setup (once)

```sh
brew tap femifleming/tap
brew trust --tap femifleming/tap     # Homebrew 7 and newer
```

The apps and plug-ins are signed but not notarised. The casks clear the download quarantine for you, so they open and load in your DAW without warnings.

## Instruments and effects (macOS)

| Install | What you get | Repo |
|---|---|---|
| `brew install --cask femifleming/tap/chloaelis` | **Chloaelis**: dual-channel filter, tube and delay instrument with a Lorenz attractor. App, AU, VST3 | [Chloaelis](https://github.com/femifleming/Chloaelis) |
| `brew install --cask femifleming/tap/chloaeilius` | **Chloaeilius**: Chloaelis as spatial audio (Ambisonics). App, AU, VST3 | [Chloaelis](https://github.com/femifleming/Chloaelis/tree/main/Chloaeilius) |
| `brew install --cask femifleming/tap/cloudfin` | **Cloudfin**: dreamy, floating multi-effect in any order. App, AU, VST3 | [Cloudfin](https://github.com/femifleming/Cloudfin) |
| `brew install --cask femifleming/tap/leitner` | **Leitner**: Cloudfin as a sound space, an Ambisonics encoder (3rd–7th order). App, AU, VST3 | [Cloudfin](https://github.com/femifleming/Cloudfin/tree/main/Leitner) |
| `brew install --cask femifleming/tap/ex-gf` | **EX-GF**: nine disting EX-style instruments and effects (Multisample, Poly Wavetable, Poly FM, Poly Exciter, Granulator, Multi-FX, Resonator, Spectral Freeze, Macro Oscillator 2). Apps, AU, VST3 | [ex-gf](https://github.com/femifleming/ex-gf) |
| `brew install --cask femifleming/tap/ex-gf-sd-card` | **EX-GF SD card**: the free sample library (multisamples, wavetables, exciters), into `~/Music/EX SD Card` | [ex-gf](https://github.com/femifleming/ex-gf) |
| `brew install --cask femifleming/tap/nabra` | **Nabra**: knobless tapestry modular synth after Peter Blasser's Nabra. App, AU, VST3 | [nabra](https://github.com/femifleming/nabra) |
| `brew install --cask femifleming/tap/obliqsound` | **ObliqSound**: polyphonic synth and field-recording instrument with a living topographic panel. App, plus the AU and VST3 (`obliqsound-au`, `obliqsound-vst3`, installed with it) | [obliqsound](https://github.com/femifleming/obliqsound) |
| `brew install --cask femifleming/tap/obliqsonic` | **ObliqSonic**: ObliqSound as 3rd-order Ambisonics, for IEM and SPARTA. App, plus AU and VST3 (`obliqsonic-au`, `obliqsonic-vst3`) | [obliqsound](https://github.com/femifleming/obliqsound) |
| `brew install --cask femifleming/tap/pinkiepiesballoonshop` | **Pinkie Pie's Balloon Shop**: a multi-effect you play as balloons. App, AU, VST3 | [PinkiePiesBalloonShop](https://github.com/femifleming/PinkiePiesBalloonShop) |
| `brew install --cask femifleming/tap/pinkiepiesballoonpalace` | **Pinkie Pie's Balloon Palace**: the Balloon Shop in spatial audio, an Ambisonics encoder (1st–7th order). App, AU, VST3 | [PinkiePiesBalloonShop](https://github.com/femifleming/PinkiePiesBalloonShop/tree/main/BalloonPalace) |
| `brew install --cask femifleming/tap/orca-seaflake` | **Orca Seaflake**: live-coding grid sequencer for MIDI, OSC and UDP, with Song Mode. App | [orca_seaflake](https://github.com/femifleming/orca_seaflake) |

Only want the plug-ins of ObliqSound or ObliqSonic? Install `obliqsound-au` / `obliqsound-vst3` (or the `obliqsonic-` ones) on their own.

### Everything at once

```sh
brew install --cask femifleming/tap/chloaelis femifleming/tap/chloaeilius \
  femifleming/tap/cloudfin femifleming/tap/leitner \
  femifleming/tap/ex-gf femifleming/tap/ex-gf-sd-card \
  femifleming/tap/nabra femifleming/tap/obliqsound femifleming/tap/obliqsonic \
  femifleming/tap/pinkiepiesballoonshop femifleming/tap/pinkiepiesballoonpalace \
  femifleming/tap/orca-seaflake
```

## Command-line tools and Linux

| Install | What you get |
|---|---|
| `brew install --formula femifleming/tap/orca-seaflake-terminal` | **Orca Seaflake for the terminal** (macOS and Linux, needs Node): `orca-seaflake` |
| `brew install --formula femifleming/tap/nabra` | **Nabra for Linux** (x86_64): app, VST3, LV2. Run `nabra-link-plugins` once afterwards |
| `brew install --formula femifleming/tap/ex-gf` | **EX-GF built from source** (macOS and Linux): VST3, AU / LV2, standalone apps |

`ex-gf` and `nabra` are both a cask (prebuilt Mac app) and a formula (Linux / from source). That's why the commands above always say `--cask` or `--formula`.

## Windows (Scoop)

This repo is also a [Scoop](https://scoop.sh) bucket:

```powershell
scoop bucket add femifleming https://github.com/femifleming/homebrew-tap
scoop install femifleming/nabra
```

## Updating and removing

```sh
brew update && brew upgrade --cask        # every installed cask, these included
brew uninstall --cask femifleming/tap/cloudfin
brew uninstall --zap --cask femifleming/tap/cloudfin    # also removes its settings
```

## Coming from the old per-instrument taps

Earlier, each instrument had its own tap (`femifleming/cloudfin`, `femifleming/nabra`, `femifleming/orca_seaflake`, `femifleming/pinkiepiesballoonshop`, `femifleming/ex-gf`). They still work, but new versions land here. To switch:

```sh
brew uninstall --cask cloudfin                 # for each one you have
brew untap femifleming/cloudfin femifleming/nabra femifleming/orca_seaflake \
  femifleming/pinkiepiesballoonshop femifleming/ex-gf
brew install --cask femifleming/tap/cloudfin
```

## For the maintainer

- Casks are in `Casks/`, formulae in `Formula/`, the Scoop manifest in `bucket/`.
- Check before pushing: `brew style femifleming/tap` and `brew audit --tap femifleming/tap`.
- Clear quarantine with `preflight_steps` / `postflight_steps`. Homebrew 7 rejects plain Ruby `preflight do` / `postflight do` blocks.
