## ansi_shadow

I really want Katakana characters drawn in [ANSI Shadow](https://github.com/xero/figlet-fonts/blob/master/Examples.md), but figlet only supports ASCII.

```sh
$ bin/console
irb(main):001> puts AnsiShadow::Text.from_str("コーヒー")
████████████              ██
        ████              ██    ██████
        ████              ████████
        ████ ████████████ ██           ████████████
        ████              ██
        ████              ████
████████████                ██████████
=> nil
irb(main):002> puts AnsiShadow::Text.from_str("コーヒー").shadow
████████████╗               ██╗
╚═══════████║               ██║   ██████╗
        ████║               ████████╔═══╝
        ████║ ████████████╗ ██╔═════╝     ████████████╗
        ████║ ╚═══════════╝ ██║           ╚═══════════╝
        ████║               ████╗
████████████║               ╚═██████████╗
╚═══════════╝                 ╚═════════╝
=> nil
```

