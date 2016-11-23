#!/bin/sh

http -v --form POST http://35.164.197.92/signup 'Content-Type:multipart/form-data' user[name]=abcde user[email]=abcde@defg.com user[password]=123456 user[password_confirmation]=123456 commit='Create my account'
