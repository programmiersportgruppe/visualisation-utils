visualisation-utils
===================

a collection of scripts for standard visualisation tasks

Installing
==========

`gnuplot` is required for these scripts to work.

The installation depends on your platform, e.g. for Linux:

~~~ .bash
sudo apt-get install gnuplot
~~~

Then you can install the actual visualisation-utils gem:

~~~ .bash
gem install visualisation-utils
~~~

scatter-plot
============

Prints scatter plots of one or more columns of whitespace separated data using
gnuplot as a backend.


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

heat-map
========

Prints a heat map visualising the distribution of
geo coordinate samples.

~~~ .bash
cat | heat-map <<'END'
38.6,-90.5
38.6,-90.5
40.5,-74.3
34.4,-92.2
42.5,-83.0
34.1,-92.0
33.3,-111.9
34.1,-91.8
34.2,-86.8
END
~~~

This will render to the following visualisation:

![map](https://raw.github.com/programmiersportgruppe/visualisation-utils/master/doc/heat-map.png)


TODO
====

- [X] Overriding of autoscale
- [X] Create nice PNGs
- [X] Line plots
- [ ] Changing changing the size of the dots
- [X] Secondary y-axis
- [ ] Bar chart single series
- [ ] Bar chart multiple series
- [ ] Discrete y-values, e.g. to visualise events over time
- [ ] Histogram plotting

