#! /bin/bash

cd ~ && cd Sites/wordpress
echo "Hello, We're about to create a new WordPress installation."

echo "Please provide a name for your project."
read -p "Project name: " PROJECT_NAME

wp core download --path=$PROJECT_NAME

cd $PROJECT_NAME

wp config create --dbname=$PROJECT_NAME --dbuser=root --dbprefix="gloo_"

# Set the WP_DEBUG constant to true.
wp config set WP_DEBUG true --raw

wp db create


echo "Please provide a title for your new WordPress site."
read SITE_TITLE


wp core install --url=http://$PROJECT_NAME.test --title="$SITE_TITLE" --admin_user="gloo" --admin_password="advertisingthatsticks" --admin_email=websites@glooadvertising.com.au --locale=en_AU

wp plugin delete akismet
wp plugin delete hello

wp post delete 1 2 3
# wp post delete --post_type=page --post_title='Sample Page'
# wp post delete --post_type=page --post_title='Privacy Policy'

wp post create --post_type=page --post_title='Home' --post_status=publish

valet link

cd wp-content/themes/

git clone https://github.com/jeffreyvr/tailpress.git

mv tailpress $PROJECT_NAME-theme

wp theme activate $PROJECT_NAME-theme

cd $PROJECT_NAME-theme

code .

open http://$PROJECT_NAME.test

# mkdir ./wp-content/themes/$PROJECT_NAME-theme && code ./wp-content/themes/$PROJECT_NAME-theme