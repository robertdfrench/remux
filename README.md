Remux
=====

Reconnect to an existing tmux session on another machine. Great for using your laptop as a dummy terminal to another box.

### Installation

```bash
git clone https://github.com/robertdfrench/remux.git
echo "source remux/remux.sh" >> .bash_profile # Or .zprofile
```

Now the `remux` function will be in your path next shell session.

### Usage

Running `remux sebastion` will attempt to log you into the host `sebastion` and reconnect to an old / establish a new session called "base". Use ssh keys if you can.

#### Special usage for Hipsters

If you really want to be a pratt, put `remux sebastion` at the end of your bash or zsh profile. Every new shell will automatically attach to the host machine, and you can gloat to your remaining friends that you are now too cool for laptop development.
