c.aliases = {
        'x': 'quit --save',
        **c.aliases
}
c.editor.command = ['urxvt', '-e', 'nvim', '{file}', '+{line}']
c.messages.timeout = 5000
c.tabs.background = True
c.url.searchengines = {
        'aw': 'https://wiki.archlinux.org/index.php?search={}',
        'ddg': 'https://duckduckgo.com/?q={}',
        'yt': 'https://www.youtube.com/results?search_query={}',
        **c.url.searchengines
}

config.bind('<Ctrl-Shift-y>', 'hint links spawn --detach mpv --force-window yes {hint-url}')
