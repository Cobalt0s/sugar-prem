# On Premise installation of SugarCRM

## Download Files

Go to [SugarCRM dashboard](https://auth.sugarcrm.com/dashboard) and download zip file.
Makefile is using `SugarEnt-14.0.0.zip`.

## Prepare environment

Docker compose will start, script will add configs and modify database. Then docker will be shut, we need this so when we restart volume changes are propagated.
```
make install
```
Next run docker compose.
```
make start
```

## PHP info

This can be checked by hitting http://localhost:8000/ampersand-sugar/info.php

## Installation

Setup Wizard at http://localhost:8000/ampersand-sugar/install.php
It is expected that you will get one 500 error. Restart installation process and it will go away.

## Done

Ready to use CRM.
