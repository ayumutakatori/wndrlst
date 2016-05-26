Work in progress...

# WNDRLST

This is Wunderlist API wrapper.

## HowTo

### initialize

```
wndrlst = Wndrlst::Connect.new(client_id, client_secret, access_token)
```

### get lists

```
lists = wndrlst.lists(listname)
```

### get tasks

```
# all tasks
tasks = wndrlst.lists(listname).tasks(:all)

# done tasks
tasks = wndrlst.lists(listname).tasks(:finished)

# not done tasks
tasks = wndrlst.lists(listname).tasks(:progress)

```

### secret my command.

#### daily done report.

```
wndrlst = Wndrlst::Connect.new(client_id, client_secret, access_token)
wndrlst.lists(listname).report(date)
```
