CASK ?= cask
EMACS ?= emacs

PKGDIR := $(shell EMACS=$(EMACS) $(CASK) package-directory)

SRCS = frame-opacity.el
OBJECTS = $(SRCS:.el=.elc)

all: test

test: unit

compile : $(OBJECTS)

unit: compile
	${CASK} exec ert-runner

install:
	${CASK} install

deps : $(PKGDIR)

$(PKGDIR) : Cask
	$(CASK) install
	touch $(PKGDIR)

.PHONY:	all test undercover install deps

%.elc : %.el $(PKGDIR)
	$(CASK) exec $(EMACS) -Q --batch $(EMACSFLAGS) -f batch-byte-compile $<
