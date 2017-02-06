Logos
=====

Requierments
------------

- `figlet`
- `toilet`

Generate logos
--------------

Plain:

```shell
echo "tsm" | figlet -f standard -w60 -c | sed -e 's/[[:space:]]*$//' \
  && echo "Tmux Session Manager" | figlet -f term -w60 -c | sed -e 's/[[:space:]]*$//' \
  && echo "Save and restore the state of tmux sessions and windows." | figlet -f term -w60 -c | sed -e 's/[[:space:]]*$//' \
  && echo
```

Color:

```shell
echo "tsm" | figlet -f standard -w60 -c | toilet --gay -f term | sed -e 's/[[:space:]]*$//' \
  && echo "Tmux Session Manager" | figlet -f term -w60 -c | toilet --gay -f term | sed -e 's/[[:space:]]*$//' \
  && echo "Save and restore the state of tmux sessions and windows." | figlet -f term -w60 -c | toilet --gay -f term | sed -e 's/[[:space:]]*$//' \
  && echo
```
