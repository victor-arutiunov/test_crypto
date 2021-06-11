!/usr/bin/env sh

# остановить публикацию при ошибках
set -e

# сборка
npm run build

# переход в каталог сборки
cd dist

# если вы публикуете на пользовательский домен
echo 'https://github.com/victor-arutiunov/test_crypto' > test_crypto

git init
git add -A
git commit -m 'deploy'

# если вы публикуете по адресу https://<USERNAME>.github.io
git push -f git@github.com:victor-arutiunov/test_crypto.git master:gh-pages

cd -
