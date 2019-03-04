# frame-opacity

Some elisp helpers to dynamically change emacs frame transparency using some keyboard shortcuts.

## Configurtion sample:

```elisp
(require 'frame-opacity)
(global-set-key [C-prior]  '(lambda () (interactive) (frame-opacity-change-relative +5)))
(global-set-key [C-next]   '(lambda () (interactive) (frame-opacity-change-relative -5)))
```

## Test/Compile using emacs24 on Travis

<a href='https://travis-ci.org/fredericfrances/frame-opacity.svg?branch=master'><img src='https://travis-ci.org/fredericfrances/frame-opacity.svg?branch=master' alt='Build Status'/></a>

[![Coverage Status](https://coveralls.io/repos/github/fredericfrances/frame-opacity/badge.svg?branch=master)](https://coveralls.io/github/fredericfrances/frame-opacity?branch=master)


