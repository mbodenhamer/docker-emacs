(require 'package)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(package-refresh-contents)
(package-install 'elpy)
