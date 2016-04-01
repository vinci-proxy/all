
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

install: clone link

web:
	cd web && make 
	cd web && git commit -am 'feat(docs): update site' && git push origin master

clone:
	@if [ ! -d context ]; then git clone https://github.com/vinci-proxy/context.git; fi;
	@if [ ! -d forward ]; then git clone https://github.com/vinci-proxy/forward.git; fi;
	@if [ ! -d intercept ]; then git clone https://github.com/vinci-proxy/intercept.git; fi;
	@if [ ! -d layer ]; then git clone https://github.com/vinci-proxy/layer.git; fi;
	@if [ ! -d mux ]; then git clone https://github.com/vinci-proxy/mux.git; fi;
	@if [ ! -d router ]; then git clone https://github.com/vinci-proxy/router.git; fi;
	@if [ ! -d replay ]; then git clone https://github.com/vinci-proxy/replay.git; fi;
	@if [ ! -d utils ]; then git clone https://github.com/vinci-proxy/utils.git; fi;
	@if [ ! -d vinci ]; then git clone https://github.com/vinci-proxy/vinci.git; fi;
	@if [ ! -d trace ]; then git clone https://github.com/vinci-proxy/trace.git; fi;
	@if [ ! -d web ]; then git clone https://github.com/vinci-proxy/vinci-proxy.github.io.git web; fi;

pull:
	@if [ -d context ]; then git --work-tree=./context --git-dir=./context/.git pull origin master; fi;
	@if [ -d forward ]; then git --work-tree=./forward --git-dir=./forward/.git pull origin master; fi;
	@if [ -d intercept ]; then git --work-tree=./intercept --git-dir=./intercept/.git pull origin master; fi;
	@if [ -d layer ]; then git --work-tree=./layer --git-dir=./layer/.git pull origin master; fi;
	@if [ -d mux ]; then git --work-tree=./mux --git-dir=./mux/.git pull origin master; fi;
	@if [ -d router ]; then git --work-tree=./router --git-dir=./router/.git pull origin master; fi;
	@if [ -d replay ]; then git --work-tree=./replay --git-dir=./replay/.git pull origin master; fi;
	@if [ -d utils ]; then git --work-tree=./utils --git-dir=./utils/.git pull origin master; fi;
	@if [ -d vinci ]; then git --work-tree=./vinci --git-dir=./vinci/.git pull origin master; fi;
	@if [ -d trace ]; then git --work-tree=./trace --git-dir=./trace/.git pull origin master; fi;
	@if [ -d web ]; then git --work-tree=./web --git-dir=./web/.git pull origin master; fi;

link:
	mkdir -p $(GOPATH)/src/gopkg.in/vinci-proxy
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/context.v0 ]; then ln -s $(PWD)/context $(GOPATH)/src/gopkg.in/vinci-proxy/context.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/forward.v0 ]; then ln -s $(PWD)/forward $(GOPATH)/src/gopkg.in/vinci-proxy/forward.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/intercept.v0 ]; then ln -s $(PWD)/intercept $(GOPATH)/src/gopkg.in/vinci-proxy/intercept.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/layer.v0 ]; then ln -s $(PWD)/layer $(GOPATH)/src/gopkg.in/vinci-proxy/layer.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/mux.v0 ]; then ln -s $(PWD)/mux $(GOPATH)/src/gopkg.in/vinci-proxy/mux.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/router.v0 ]; then ln -s $(PWD)/router $(GOPATH)/src/gopkg.in/vinci-proxy/router.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/replay.v0 ]; then ln -s $(PWD)/replay $(GOPATH)/src/gopkg.in/vinci-proxy/replay.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/utils.v0 ]; then ln -s $(PWD)/utils $(GOPATH)/src/gopkg.in/vinci-proxy/utils.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/vinci.v0 ]; then ln -s $(PWD)/vinci $(GOPATH)/src/gopkg.in/vinci-proxy/vinci.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinci-proxy/trace.v0 ]; then ln -s $(PWD)/trace $(GOPATH)/src/gopkg.in/vinci-proxy/trace.v0; fi;
