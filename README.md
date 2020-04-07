# Jekyll-Encrypt

## Overview

Encrypts blog posts (on site generation) with aes-cbc-256 using a jekyll plugin. The decryption is done via javascript.

## Install

1. Put "encrypt.rb" into _plugins
2. Put "secret_post.html" into _layouts and use the layout on the blog post you want to encrypt. In addition you need to create a key header field that containts the key you want to encrypt the particular post with. You probably want to modify the "secret_post.html" to fit your blogs theme.
3. add `gem "bcrypt"` to your Gemfile and `gem install nokogiri`
4. Be sure to disable the jekyll feed / delete the feed.xml or there could be unencrypted content in it

## Example Post

```
---
layout: secret_post
title:  "Hello"
date:   2019-01-01 00:00:00
key: "my_secret_key"

---

Hello, World!
```
