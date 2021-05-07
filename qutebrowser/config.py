import subprocess

config.load_autoconfig()


def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props


c.aliases = {'x': 'quit --save', **c.aliases}
c.auto_save.session = True
c.content.webrtc_ip_handling_policy = 'default-public-interface-only'
c.editor.command = ['alacritty', '-e', 'nvim', '{file}', '+{line}']
c.messages.timeout = 5000
c.session.lazy_restore = True
c.tabs.background = True
c.spellcheck.languages = ['en-US']
c.url.searchengines = {
    'aw': 'https://wiki.archlinux.org/index.php?search={}',
    'aa': 'https://aur.archlinux.org/packages/?K={}',
    'am': 'https://smile.amazon.com/s?k={}',
    'dd': 'https://duckduckgo.com/?q={}',
    'gg': 'https://www.google.com/search?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'gh': 'https://github.com/search?q={}',
    'ghu': 'https://github.com/{}',
    'wi': 'https://en.wikipedia.org/w/index.php?search={}',
    'rs': 'https://doc.rust-lang.org/std/index.html?search={}',
    'rsb': 'https://doc.rust-lang.org/beta/std/index.html?search={}',
    'rsn': 'https://doc.rust-lang.org/nightly/std/index.html?search={}',
    'rsc': 'https://crates.io/search?q={}',
    'rsd': 'https://docs.rs/releases/search?query={}',
    'rsl': 'https://lib.rs/search?q={}',
    'mwd': 'https://www.merriam-webster.com/dictionary/{}',
    'mwt': 'https://www.merriam-webster.com/thesaurus/{}',
    'gld': 'http://docs.gl/gl4/{}',
    **c.url.searchengines
}

config.bind('<Ctrl-Shift-y>',
            'hint links spawn --detach mpv --force-window yes {hint-url}')

config.bind('<Ctrl-Shift-t>', 'config-cycle tabs.show always switching')

xres_font = read_xresources('qutebrowser.')

c.fonts.default_family = xres_font['qutebrowser.fontface']
c.fonts.default_size = xres_font['qutebrowser.fontsize'] + 'pt'
c.fonts.web.family.fixed = 'Hack Nerd Font'
c.fonts.web.family.sans_serif = 'Droid Serif'
c.fonts.web.family.serif = 'Droid Sans'
c.fonts.web.size.default = 14
c.fonts.web.size.default_fixed = 14

xres_colors = read_xresources('*')

c.colors.completion.fg                          = xres_colors['*color7']
c.colors.completion.odd.bg                      = xres_colors['*color0']
c.colors.completion.even.bg                     = xres_colors['*color0']
c.colors.completion.category.fg                 = xres_colors['*color4']
c.colors.completion.category.bg                 = xres_colors['*color0']
c.colors.completion.category.border.top         = xres_colors['*color0']
c.colors.completion.category.border.bottom      = xres_colors['*color0']
c.colors.completion.item.selected.fg            = xres_colors['*color0']
c.colors.completion.item.selected.bg            = xres_colors['*color4']
c.colors.completion.item.selected.border.top    = xres_colors['*color4']
c.colors.completion.item.selected.border.bottom = xres_colors['*color4']
c.colors.completion.item.selected.match.fg      = xres_colors['*color0']
c.colors.completion.match.fg                    = xres_colors['*color16']
c.colors.completion.scrollbar.fg                = xres_colors['*color7']
c.colors.completion.scrollbar.bg                = xres_colors['*color0']
c.colors.contextmenu.menu.bg                    = xres_colors['*color0']
c.colors.contextmenu.menu.fg                    = xres_colors['*color7']
c.colors.contextmenu.selected.bg                = xres_colors['*color4']
c.colors.contextmenu.selected.fg                = xres_colors['*color0']
c.colors.downloads.bar.bg                       = xres_colors['*color0']
c.colors.downloads.start.fg                     = xres_colors['*color0']
c.colors.downloads.start.bg                     = xres_colors['*color4']
c.colors.downloads.stop.fg                      = xres_colors['*color0']
c.colors.downloads.stop.bg                      = xres_colors['*color6']
c.colors.downloads.error.fg                     = xres_colors['*color1']
c.colors.hints.fg                               = xres_colors['*color0']
c.colors.hints.bg                               = xres_colors['*color3']
c.colors.hints.match.fg                         = xres_colors['*color7']
c.colors.keyhint.fg                             = xres_colors['*color7']
c.colors.keyhint.suffix.fg                      = xres_colors['*color7']
c.colors.keyhint.bg                             = xres_colors['*color0']
c.colors.messages.error.fg                      = xres_colors['*color0']
c.colors.messages.error.bg                      = xres_colors['*color1']
c.colors.messages.error.border                  = xres_colors['*color1']
c.colors.messages.warning.fg                    = xres_colors['*color0']
c.colors.messages.warning.bg                    = xres_colors['*color5']
c.colors.messages.warning.border                = xres_colors['*color5']
c.colors.messages.info.fg                       = xres_colors['*color7']
c.colors.messages.info.bg                       = xres_colors['*color0']
c.colors.messages.info.border                   = xres_colors['*color0']
c.colors.prompts.fg                             = xres_colors['*color7']
c.colors.prompts.border                         = xres_colors['*color0']
c.colors.prompts.bg                             = xres_colors['*color0']
c.colors.prompts.selected.bg                    = xres_colors['*color3']
c.colors.statusbar.normal.fg                    = xres_colors['*color7']
c.colors.statusbar.normal.bg                    = xres_colors['*color0']
c.colors.statusbar.insert.fg                    = xres_colors['*color6']
c.colors.statusbar.insert.bg                    = xres_colors['*color0']
c.colors.statusbar.passthrough.fg               = xres_colors['*color3']
c.colors.statusbar.passthrough.bg               = xres_colors['*color0']
c.colors.statusbar.private.fg                   = xres_colors['*color5']
c.colors.statusbar.private.bg                   = xres_colors['*color0']
c.colors.statusbar.command.fg                   = xres_colors['*color20']
c.colors.statusbar.command.bg                   = xres_colors['*color18']
c.colors.statusbar.command.private.fg           = xres_colors['*color5']
c.colors.statusbar.command.private.bg           = xres_colors['*color18']
c.colors.statusbar.caret.fg                     = xres_colors['*color4']
c.colors.statusbar.caret.bg                     = xres_colors['*color0']
c.colors.statusbar.caret.selection.fg           = xres_colors['*color4']
c.colors.statusbar.caret.selection.bg           = xres_colors['*color0']
c.colors.statusbar.progress.bg                  = xres_colors['*color4']
c.colors.statusbar.url.fg                       = xres_colors['*color7']
c.colors.statusbar.url.error.fg                 = xres_colors['*color1']
c.colors.statusbar.url.hover.fg                 = xres_colors['*color16']
c.colors.statusbar.url.success.http.fg          = xres_colors['*color2']
c.colors.statusbar.url.success.https.fg         = xres_colors['*color2']
c.colors.statusbar.url.warn.fg                  = xres_colors['*color5']
c.colors.tabs.bar.bg                            = xres_colors['*color0']
c.colors.tabs.indicator.start                   = xres_colors['*color4']
c.colors.tabs.indicator.stop                    = xres_colors['*color6']
c.colors.tabs.indicator.error                   = xres_colors['*color1']
c.colors.tabs.odd.fg                            = xres_colors['*color7']
c.colors.tabs.odd.bg                            = xres_colors['*color0']
c.colors.tabs.even.fg                           = xres_colors['*color7']
c.colors.tabs.even.bg                           = xres_colors['*color0']
c.colors.tabs.pinned.even.bg                    = xres_colors['*color2']
c.colors.tabs.pinned.even.fg                    = xres_colors['*color0']
c.colors.tabs.pinned.odd.bg                     = xres_colors['*color2']
c.colors.tabs.pinned.odd.fg                     = xres_colors['*color0']
c.colors.tabs.pinned.selected.even.bg           = xres_colors['*color4']
c.colors.tabs.pinned.selected.even.fg           = xres_colors['*color0']
c.colors.tabs.pinned.selected.odd.bg            = xres_colors['*color4']
c.colors.tabs.pinned.selected.odd.fg            = xres_colors['*color0']
c.colors.tabs.selected.odd.fg                   = xres_colors['*color0']
c.colors.tabs.selected.odd.bg                   = xres_colors['*color4']
c.colors.tabs.selected.even.fg                  = xres_colors['*color0']
c.colors.tabs.selected.even.bg                  = xres_colors['*color4']
c.colors.webpage.bg                             = xres_colors['*color7']
c.colors.webpage.darkmode.enabled               = True
