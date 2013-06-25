visualisation-utils
===================

a collection of scripts for standard visualisation tasks

Installing
==========

~~~ .bash
gem install visualisation-utils
~~~

scatter-plot
============

Prints scatter plots of one or more columns of whitespace separated data using
gnuplot as a backend


~~~ .bash
cat | scatter-plot <<'END'
1 1
2 4
3 9
4 16
5 25
END
~~~

This incantation will bring up the gnuplot gui with the following graph:

![gui](https://raw.github.com/programmiersportgruppe/visualisation-utils/master/doc/gnuplot-gui.png)

TODO
====

* Overriding of autoscale
* Create nice PNGs
* Line plots
* Changing changing the size of the dots
* Secondary y-axis
* Bar chart single series
* Bar chart multiple series
* Discrete y-values, e.g. to visualise events over time
* Histogram plotting

