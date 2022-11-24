# secret santa generator

Ever dreamt of assigning secret santa with a q script? That dream is now reality.

## dependencies

[qmail](https://github.com/t-martin/qmail) uses the sendmail Linux utility. Install this package on your distro and setup a mail user to use the generator.

And you will also need q :)

## usage

`q sendmail.q "sendmailuser@host"`

## santas.csv format

```
address,name
escrooge@bah.humbug,Ebenezer
turboman@jingleallthe.way,Howard
kmccallister@new.york,Kevin
```
