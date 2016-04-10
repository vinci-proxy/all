
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
	@if [ ! -d context ]; then git clone https://github.com/vinxi/context.git; fi;
	@if [ ! -d forward ]; then git clone https://github.com/vinxi/forward.git; fi;
	@if [ ! -d intercept ]; then git clone https://github.com/vinxi/intercept.git; fi;
	@if [ ! -d layer ]; then git clone https://github.com/vinxi/layer.git; fi;
	@if [ ! -d mux ]; then git clone https://github.com/vinxi/mux.git; fi;
	@if [ ! -d router ]; then git clone https://github.com/vinxi/router.git; fi;
	@if [ ! -d replay ]; then git clone https://github.com/vinxi/replay.git; fi;
	@if [ ! -d utils ]; then git clone https://github.com/vinxi/utils.git; fi;
	@if [ ! -d vinxi ]; then git clone https://github.com/vinxi/vinxi.git; fi;
	@if [ ! -d trace ]; then git clone https://github.com/vinxi/trace.git; fi;
	@if [ ! -d web ]; then git clone https://github.com/vinxi/vinxi.github.io.git web; fi;
	@if [ ! -d balancer ]; then git clone https://github.com/vinxi/balancer.git; fi;
	@if [ ! -d metrics ]; then git clone https://github.com/vinxi/metrics.git; fi;
	@if [ ! -d trace ]; then git clone https://github.com/vinxi/trace.git; fi;
	@if [ ! -d consul ]; then git clone https://github.com/vinxi/consul.git; fi;
	@if [ ! -d auth ]; then git clone https://github.com/vinxi/auth.git; fi;

pull:
	@if [ -d context ]; then git --work-tree=./context --git-dir=./context/.git pull origin master; fi;
	@if [ -d forward ]; then git --work-tree=./forward --git-dir=./forward/.git pull origin master; fi;
	@if [ -d intercept ]; then git --work-tree=./intercept --git-dir=./intercept/.git pull origin master; fi;
	@if [ -d layer ]; then git --work-tree=./layer --git-dir=./layer/.git pull origin master; fi;
	@if [ -d mux ]; then git --work-tree=./mux --git-dir=./mux/.git pull origin master; fi;
	@if [ -d router ]; then git --work-tree=./router --git-dir=./router/.git pull origin master; fi;
	@if [ -d replay ]; then git --work-tree=./replay --git-dir=./replay/.git pull origin master; fi;
	@if [ -d utils ]; then git --work-tree=./utils --git-dir=./utils/.git pull origin master; fi;
	@if [ -d vinxi ]; then git --work-tree=./vinxi --git-dir=./vinxi/.git pull origin master; fi;
	@if [ -d trace ]; then git --work-tree=./trace --git-dir=./trace/.git pull origin master; fi;
	@if [ -d web ]; then git --work-tree=./web --git-dir=./web/.git pull origin master; fi;
	@if [ -d balancer ]; then git --work-tree=./balancer --git-dir=./balancer/.git pull origin master; fi;
	@if [ -d metrics ]; then git --work-tree=./metrics --git-dir=./metrics/.git pull origin master; fi;
	@if [ -d trace ]; then git --work-tree=./trace --git-dir=./trace/.git pull origin master; fi;
	@if [ -d consul ]; then git --work-tree=./consul --git-dir=./consul/.git pull origin master; fi;
	@if [ -d auth ]; then git --work-tree=./auth --git-dir=./auth/.git pull origin master; fi;

link:
	mkdir -p $(GOPATH)/src/gopkg.in/vinxi
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/context.v0 ]; then ln -s $(PWD)/context $(GOPATH)/src/gopkg.in/vinxi/context.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/forward.v0 ]; then ln -s $(PWD)/forward $(GOPATH)/src/gopkg.in/vinxi/forward.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/intercept.v0 ]; then ln -s $(PWD)/intercept $(GOPATH)/src/gopkg.in/vinxi/intercept.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/layer.v0 ]; then ln -s $(PWD)/layer $(GOPATH)/src/gopkg.in/vinxi/layer.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/mux.v0 ]; then ln -s $(PWD)/mux $(GOPATH)/src/gopkg.in/vinxi/mux.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/router.v0 ]; then ln -s $(PWD)/router $(GOPATH)/src/gopkg.in/vinxi/router.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/replay.v0 ]; then ln -s $(PWD)/replay $(GOPATH)/src/gopkg.in/vinxi/replay.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/utils.v0 ]; then ln -s $(PWD)/utils $(GOPATH)/src/gopkg.in/vinxi/utils.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/vinxi.v0 ]; then ln -s $(PWD)/vinxi $(GOPATH)/src/gopkg.in/vinxi/vinxi.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/trace.v0 ]; then ln -s $(PWD)/trace $(GOPATH)/src/gopkg.in/vinxi/trace.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/balancer.v0 ]; then ln -s $(PWD)/balancer $(GOPATH)/src/gopkg.in/vinxi/balancer.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/metrics.v0 ]; then ln -s $(PWD)/metrics $(GOPATH)/src/gopkg.in/vinxi/metrics.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/trace.v0 ]; then ln -s $(PWD)/trace $(GOPATH)/src/gopkg.in/vinxi/trace.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/consul.v0 ]; then ln -s $(PWD)/consul $(GOPATH)/src/gopkg.in/vinxi/consul.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/apachelog.v0 ]; then ln -s $(PWD)/apachelog $(GOPATH)/src/gopkg.in/vinxi/apachelog.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/auth.v0 ]; then ln -s $(PWD)/auth $(GOPATH)/src/gopkg.in/vinxi/auth.v0; fi;
