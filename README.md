# bash-script-for-magento-2-building

## contains several commands:

```sh
- recursive chmod 777 for pub, static and generated directories 

$ php bin/magento setup:upgrade
$ php bin/magento setup:di:compile
$ php bin/magento index:reindex
$ php bin/magento setup:static-content:deploy -f
$ php bin/magento cache:flush
$ php bin/magento cache:clear

- again chmod 
```

***
#### Just place this file in your magento root directory and start like 
```sh
./deploy.sh
```
***
