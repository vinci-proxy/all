default: all

all: test vet lint

test:
	go test -v -race ./...

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
	@if [ ! -d intercept ]; then git clone https://github.com/vinxi/intercept.git; fi;
	@if [ ! -d replay ]; then git clone https://github.com/vinxi/replay.git; fi;
	@if [ ! -d utils ]; then git clone https://github.com/vinxi/utils.git; fi;
	@if [ ! -d vinxi ]; then git clone https://github.com/vinxi/vinxi.git; fi;
	@if [ ! -d web ]; then git clone https://github.com/vinxi/vinxi.github.io.git web; fi;
	@if [ ! -d balancer ]; then git clone https://github.com/vinxi/balancer.git; fi;
	@if [ ! -d metrics ]; then git clone https://github.com/vinxi/metrics.git; fi;
	@if [ ! -d trace ]; then git clone https://github.com/vinxi/trace.git; fi;
	@if [ ! -d consul ]; then git clone https://github.com/vinxi/consul.git; fi;
	@if [ ! -d apachelog ]; then git clone https://github.com/vinxi/apachelog.git; fi;
	@if [ ! -d auth ]; then git clone https://github.com/vinxi/auth.git; fi;
	@if [ ! -d ratelimit ]; then git clone https://github.com/vinxi/ratelimit.git; fi;
	@if [ ! -d log ]; then git clone https://github.com/vinxi/log.git; fi;
	@if [ ! -d cors ]; then git clone https://github.com/vinxi/cors.git; fi;
	@if [ ! -d ip ]; then git clone https://github.com/vinxi/ip.git; fi;
	@if [ ! -d sandbox ]; then git clone https://github.com/vinxi/sandbox.git; fi;

pull:
	@if [ -d intercept ]; then git --work-tree=./intercept --git-dir=./intercept/.git pull origin master; fi;
	@if [ -d replay ]; then git --work-tree=./replay --git-dir=./replay/.git pull origin master; fi;
	@if [ -d utils ]; then git --work-tree=./utils --git-dir=./utils/.git pull origin master; fi;
	@if [ -d vinxi ]; then git --work-tree=./vinxi --git-dir=./vinxi/.git pull origin master; fi;
	@if [ -d web ]; then git --work-tree=./web --git-dir=./web/.git pull origin master; fi;
	@if [ -d balancer ]; then git --work-tree=./balancer --git-dir=./balancer/.git pull origin master; fi;
	@if [ -d metrics ]; then git --work-tree=./metrics --git-dir=./metrics/.git pull origin master; fi;
	@if [ -d trace ]; then git --work-tree=./trace --git-dir=./trace/.git pull origin master; fi;
	@if [ -d consul ]; then git --work-tree=./consul --git-dir=./consul/.git pull origin master; fi;
	@if [ -d apachelog ]; then git --work-tree=./apachelog --git-dir=./apachelog/.git pull origin master; fi;
	@if [ -d auth ]; then git --work-tree=./auth --git-dir=./auth/.git pull origin master; fi;
	@if [ -d ratelimit ]; then git --work-tree=./ratelimit --git-dir=./ratelimit/.git pull origin master; fi;
	@if [ -d log ]; then git --work-tree=./log --git-dir=./log/.git pull origin master; fi;
	@if [ -d cors ]; then git --work-tree=./cors --git-dir=./cors/.git pull origin master; fi;
	@if [ -d ip ]; then git --work-tree=./ip --git-dir=./ip/.git pull origin master; fi;
	@if [ -d sandbox ]; then git --work-tree=./isandbox --git-dir=./isandbox/.git pull origin master; fi;

link:
	mkdir -p $(GOPATH)/src/gopkg.in/vinxi
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/intercept.v0 ]; then ln -s $(PWD)/intercept $(GOPATH)/src/gopkg.in/vinxi/intercept.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/replay.v0 ]; then ln -s $(PWD)/replay $(GOPATH)/src/gopkg.in/vinxi/replay.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/utils.v0 ]; then ln -s $(PWD)/utils $(GOPATH)/src/gopkg.in/vinxi/utils.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/vinxi.v0 ]; then ln -s $(PWD)/vinxi $(GOPATH)/src/gopkg.in/vinxi/vinxi.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/balancer.v0 ]; then ln -s $(PWD)/balancer $(GOPATH)/src/gopkg.in/vinxi/balancer.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/metrics.v0 ]; then ln -s $(PWD)/metrics $(GOPATH)/src/gopkg.in/vinxi/metrics.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/trace.v0 ]; then ln -s $(PWD)/trace $(GOPATH)/src/gopkg.in/vinxi/trace.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/consul.v0 ]; then ln -s $(PWD)/consul $(GOPATH)/src/gopkg.in/vinxi/consul.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/apachelog.v0 ]; then ln -s $(PWD)/apachelog $(GOPATH)/src/gopkg.in/vinxi/apachelog.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/auth.v0 ]; then ln -s $(PWD)/auth $(GOPATH)/src/gopkg.in/vinxi/auth.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/ratelimit.v0 ]; then ln -s $(PWD)/ratelimit $(GOPATH)/src/gopkg.in/vinxi/ratelimit.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/log.v0 ]; then ln -s $(PWD)/log $(GOPATH)/src/gopkg.in/vinxi/log.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/cors.v0 ]; then ln -s $(PWD)/cors $(GOPATH)/src/gopkg.in/vinxi/cors.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/ip.v0 ]; then ln -s $(PWD)/ip $(GOPATH)/src/gopkg.in/vinxi/ip.v0; fi;
	@if [ ! -d $(GOPATH)/src/gopkg.in/vinxi/sandbox.v0 ]; then ln -s $(PWD)/sandbox $(GOPATH)/src/gopkg.in/vinxi/sandbox.v0; fi;
