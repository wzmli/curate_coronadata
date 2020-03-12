current: target
-include target.mk

-include makestuff/perl.def

Drop = ~/Dropbox

######################################################################

## Not clear whether this chains yet 2020 Mar 05 (Thu)

pardirs += datarepos

dr += JHU

Ignore += $(dr)
$(dr):
	cd .. && $(MAKE) datarepos/$@
	$(LNF) ../datarepos/$@ .

JHU/%: JHU
Ignore += cases.csv
whocases.csv: JHU/who_covid_19_situation_reports/who_covid_19_sit_rep_time_series/who_covid_19_sit_rep_time_series.csv
	$(copy)

######################################################################

WHOdat.Rout: whocases.csv WHOdat.R
	$(run-R)

WHOplot.Rout: WHOdat.Rout WHOplot.R
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
