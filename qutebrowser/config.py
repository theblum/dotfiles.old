c.aliases = {
        'x': 'quit --save',
        **c.aliases
}
c.editor.command = ['urxvtc', '-e', 'nvim', '{file}', '+{line}']
c.messages.timeout = 5000
c.tabs.background = True
c.url.searchengines = {
        'aw': 'https://wiki.archlinux.org/index.php?search={}',
        'aa': 'https://aur.archlinux.org/packages/?K={}',
        'cr': 'https://crates.io/search?q={}',
        'dd': 'https://duckduckgo.com/?q={}',
        'yt': 'https://www.youtube.com/results?search_query={}',
        'gh': 'https://github.com/search?q={}',
        'ghu' : 'https://github.com/{}',
        'wi': 'https://en.wikipedia.org/w/index.php?search={}',
        'rs': 'https://doc.rust-lang.org/std/index.html?search={}',
        'rsb': 'https://doc.rust-lang.org/nightly/std/index.html?search={}',
        'rsn': 'https://doc.rust-lang.org/beta/std/index.html?search={}',
        **c.url.searchengines
}

config.bind('<Ctrl-Shift-y>', 'hint links spawn --detach mpv --force-window yes {hint-url}')
