#! /bin/bash

cd ~ && cd Sites/wordpress

echo "Please enter the slug of the website you want to delete: "

read SITE_SLUG

rm -r $SITE_SLUG

mysql -u root -e "drop database $SITE_SLUG;"

echo "The website $SITE_SLUG and its database have been removed siccessfully."