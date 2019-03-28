# Jekyll-Encrypt

## Overview

Encrypts blog posts (on site generation) with aes-cbc-256 using a jekyll plugin. The decryption is done via javascript.

## Install

1. Put "encrypt.rb" into /plugins
2. Put "secret_post.html" into /layouts and use the layout on the blog post you want to encrypt. In addition you need to create a key header field that containts the key you want to encrypt the particular post with. You probably want to modify the "secret_post.html" to fit your blogs theme.

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