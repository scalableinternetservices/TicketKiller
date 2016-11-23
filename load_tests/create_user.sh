#!/bin/sh

set -e

# install httpie first
# mac:    brew install httpie
# ubuntu: apt-get install httpie

if [ -z "$1" ]
then
    host=localhost:3000         # 35.164.197.92
else
    host="$1"
fi

http -v --form POST http://"$host"/signup 'Content-Type:multipart/form-data' user[name]=abcde user[email]=abcde@defg.com user[password]=123456 user[password_confirmation]=123456 commit='Create my account'


# 1. find the body of the submitted form
# 2. substitute & with &amp;
# 3. change first part of email field to %%_random_user_email%%
# 4. paste the body of the submitted form to `contents=<form_body>'
#    part in the load testing script
