default: all

all: test vet lint

test: 
	go test ./...

fmt: 
	gofmt -s -d ./...

lint: 
	golint ./...

vet: 
	go vet ./...

sloc:
	wc -l */**.go

clone:
	@if [ ! -d context ]; then git clone https://github.com/vinci-proxy/context.git; fi;
	@if [ ! -d forward ]; then git clone https://github.com/vinci-proxy/forward.git; fi;
	@if [ ! -d intercept ]; then git clone https://github.com/vinci-proxy/intercept.git; fi;
	@if [ ! -d layer ]; then git clone https://github.com/vinci-proxy/layer.git; fi;
	@if [ ! -d mux ]; then git clone https://github.com/vinci-proxy/mux.git; fi;
	@if [ ! -d pat ]; then git clone https://github.com/vinci-proxy/pat.git; fi;
	@if [ ! -d replay ]; then git clone https://github.com/vinci-proxy/replay.git; fi;
	@if [ ! -d utils ]; then git clone https://github.com/vinci-proxy/utils.git; fi;
	@if [ ! -d route ]; then git clone https://github.com/vinci-proxy/route.git; fi;
	@if [ ! -d vinci ]; then git clone https://github.com/vinci-proxy/vinci.git; fi;
	@if [ ! -d web ]; then git clone https://github.com/vinci-proxy/vinci-proxy.github.io.git web; fi;

link:
	mkdir -p $(GOPATH)/src/gopkg.in/vinci-proxy
	ln -s $(pwd)/context $(GOPATH)/src/gopkg.in/vinci-proxy/context.v0
	ln -s $(pwd)/forward $(GOPATH)/src/gopkg.in/vinci-proxy/forward.v0
	ln -s $(pwd)/intercept $(GOPATH)/src/gopkg.in/vinci-proxy/intercept.v0
	ln -s $(pwd)/layer $(GOPATH)/src/gopkg.in/vinci-proxy/layer.v0
	ln -s $(pwd)/mux $(GOPATH)/src/gopkg.in/vinci-proxy/mux.v0
	ln -s $(pwd)/pat $(GOPATH)/src/gopkg.in/vinci-proxy/pat.v0
	ln -s $(pwd)/replay $(GOPATH)/src/gopkg.in/vinci-proxy/replay.v0
	ln -s $(pwd)/utils $(GOPATH)/src/gopkg.in/vinci-proxy/utils.v0
	ln -s $(pwd)/route $(GOPATH)/src/gopkg.in/vinci-proxy/route.v0
	ln -s $(pwd)/vinci $(GOPATH)/src/gopkg.in/vinci-proxy/vinci.v0
