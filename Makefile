current: target
-include target.mk

-include makestuff/perl.def

Drop = ~/Dropbox

######################################################################


Sources += $(wildcard *.R)
Ignore += $(wildcard *.csv)

JHU_dat.Rout: JHUdat.R
	$(run-R)

WHO_dat.Rout: WHOdat.R
	$(run-R)



## WHO_clean.Rout: clean.R
## JHU_clean.Rout: clean.R
%_clean.Rout: %_dat.Rout clean.R
	$(run-R)

## WHO_plot.Rout: plot.R
## JHU_plot.Rout: plot.R
%_plot.Rout: %_clean.Rout plot.R
	$(run-R)


linelist.Rout: linelist.R
   $(run-R)

clean_linelist.Rout: linelist.R clean_linelist.R
	$(run-R)

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/wrapR.mk
## -include makestuff/pandoc.mk

-include makestuff/git.mk
-include makestuff/texdeps.mk
-include makestuff/visual.mk
-include makestuff/hotcold.mk
-include makestuff/cihrpaste.mk
-include makestuff/pandoc.mk
-include makestuff/projdir.mk
