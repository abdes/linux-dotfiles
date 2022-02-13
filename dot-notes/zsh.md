# Additional setup actions for zsh

## zsh-syntax-highlighting plugin

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## gnupg key servers

ISP blocks key servers, use different DNS

/etc/resolv.conf

nameserver 8.8.8.8
nameserver 8.8.4.4
