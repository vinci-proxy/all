# vinci/all

vinci development simple and fun with all-in-one packages set up.

## Prerequisites

- `go` (be sure $GOPATH is properly defined)
- `git`

## Set up

Clone all the repositories:
```bash
$ make clone
```

Setup packages symlinks in $GOPATH (optional):
```bash
$ make link
```

## Development

Run all package tests:
```bash
$ make test
```

Get SLOC:
```bash
$ make sloc
```

## License

MIT
