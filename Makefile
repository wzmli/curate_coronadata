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

# Added a semicolon 2020 Mar 12 (Thu). Did it help with chaining?
JHU/%: JHU ;
Ignore += cases.csv
whocases.csv: JHU/who_covid_19_situation_reports/who_covid_19_sit_rep_time_series/who_covid_19_sit_rep_time_series.csv
	$(copy)
jhucases.csv: JHU/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv
	$(copy)

######################################################################
JHU_dat.Rout: jhucases.csv JHUdat.R
	$(run-R)

WHO_dat.Rout: whocases.csv WHOdat.R
	$(run-R)

## WHO_clean.Rout: clean.R
## JHU_clean.Rout: clean.R
%_clean.Rout: %_dat.Rout clean.R
	$(run-R)

## WHO_plot.Rout: plot.R
## JHU_plot.Rout: plot.R
%_plot.Rout: %_clean.Rout plot.R
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
