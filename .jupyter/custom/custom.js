require(["nbextensions/snippets_menu/main"], function (snippets_menu) {
    console.log('Loading `snippets_menu` customizations from `custom.js`');
    var my_favorites = {
        'name' : 'My favorites',
        'sub-menu' : [
            {
                'name' : 'std_input',
                'snippet' : [
    "import numpy as np",
    "from sys import stdin",
    "\n",
    'file = "test/sample-1.in"',
    'stdin = open(file)',
    "\n",
    "read = stdin.buffer.read",
    "readline = stdin.buffer.readline",
    "readlines = stdin.buffer.readlines",
    "\n",
    "def from_read(dtype=np.int64):",
    "    return np.fromstring(read().decode(), dtype=dtype, sep=\" \")",
    "def from_readline(dtype=np.int64):",
    "    return np.fromstring(readline().decode(), dtype=dtype, sep=\" \")",
    "\n",
    "N = int(readline())",
    "X = from_readline()",
    "N, M, Q = from_readline()",
    "wv = np.array([from_readline() for _ in range(N)])\n",
    "\n"
,
		]
            },
            {
                'name' : 'Another menu item',
                'snippet' : ['another_new_command',],
            },
        ],
    };
    snippets_menu.options['menus'].push(snippets_menu.default_menus[0]);
    snippets_menu.options['menus'].push(my_favorites);
    console.log('Loaded `snippets_menu` customizations from `custom.js`');
});
