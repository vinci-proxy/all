
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

web:
	cd web && make 
	cd web && git commit -am 'feat(docs): update site' && git push origin master

clone:
	@if [ ! -d context ]; then git clone https://github.com/vinci-proxy/context.git; fi;
	@if [ ! -d forward ]; then git clone https://github.com/vinci-proxy/forward.git; fi;
	@if [ ! -d intercept ]; then git clone https://github.com/vinci-proxy/intercept.git; fi;
	@if [ ! -d layer ]; then git clone https://github.com/vinci-proxy/layer.git; fi;
	@if [ ! -d mux ]; then git clone https://github.com/vinci-proxy/mux.git; fi;
	@if [ ! -d pat ]; then git clone https://github.com/vinci-proxy/pat.git; fi;
	@if [ ! -d replay ]; then git clone https://github.com/vinci-proxy/replay.git; fi;
	@if [ ! -d utils ]; then git clone https://github.com/vinci-proxy/utils.git; fi;
	@if [ ! -d vinci ]; then git clone https://github.com/vinci-proxy/vinci.git; fi;
	@if [ ! -d web ]; then git clone https://github.com/vinci-proxy/vinci-proxy.github.io.git web; fi;

link:
	mkdir -p $(GOPATH)/src/gopkg.in/vinci-proxy
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/context.v0 ]; then ln -s $(PWD)/context $(GOPATH)/src/gopkg.in/vinci-proxy/context.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/forward.v0 ]; then ln -s $(PWD)/forward $(GOPATH)/src/gopkg.in/vinci-proxy/forward.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/intercept.v0 ]; then ln -s $(PWD)/intercept $(GOPATH)/src/gopkg.in/vinci-proxy/intercept.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/layer.v0 ]; then ln -s $(PWD)/layer $(GOPATH)/src/gopkg.in/vinci-proxy/layer.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/mux.v0 ]; then ln -s $(PWD)/mux $(GOPATH)/src/gopkg.in/vinci-proxy/mux.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/pat.v0 ]; then ln -s $(PWD)/pat $(GOPATH)/src/gopkg.in/vinci-proxy/pat.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/replay.v0 ]; then ln -s $(PWD)/replay $(GOPATH)/src/gopkg.in/vinci-proxy/replay.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/utils.v0 ]; then ln -s $(PWD)/utils $(GOPATH)/src/gopkg.in/vinci-proxy/utils.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/vinci.v0 ]; then ln -s $(PWD)/vinci $(GOPATH)/src/gopkg.in/vinci-proxy/vinci.v0; fi;
