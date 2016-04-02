# dev

vinxi development made simple and enjoyable.

## Prerequisites

- `go` (be sure $GOPATH is properly defined)
- `git`

## Set up

Clone all the package's repositories (only missing repositories will be cloned):
```bash
$ make clone
```

Create symlinks in $GOPATH (optional):
```bash
$ make link
```

## Development

Run all package tests:
```bash
$ make test
```

Lint all packages:
```bash
$ make lint
```

Run all:
```bash
$ make
```

Update docs changes and publish them:
```bash
$ make web
```

Get SLOC:
```bash
$ make sloc
```

## License

MIT
