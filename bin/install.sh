#!/bin/bash

# script à lancer depuis la racine du projet

STEP=1
echo "${STEP} - Set rights on framework files"
chown -R www-data var/*
chmod -R 777 *
HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1)
setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
((STEP++))
echo "Done."

echo "${STEP} - Install vendors and clear cache"
composer install --no-interaction --profile -vvv
bin/console ca:cl
#bin/console ca:cl --env=test --no-warmup
#bin/console ca:cl --env=prod --no-warmup
#bin/console ca:cl --env=dev --no-warmup
#((STEP++))
echo "Done."




