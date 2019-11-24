# stacks
My debian software stacks.

# How to run

```
git clone https://github.com/NobodyXu/stacks.git
cd stacks

./install.sh
```

which will automatically use `apt` to install system-level packages and configure and install using other 
delivery system (eg. pip3, R) as the current user.

Alternatively, you can set `ORIG_USER` to install non-apt packages and configure as arbitary user.
