#!/bin/bash
bin/console doctrine:create:database
bin/console doctrine:schema:create
bin/console app:create-user j.doe@mail.com John Doe p@ssword
