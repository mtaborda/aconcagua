Aconcagua
=======
This model represents measures as first class objects, that is, an object that encapsulates a number with its unit. This representation allows the programmer to use measures in arithmetic expressions as if they were numbers, but with the advantage of providing explicit information to the system, specifically, the measures units. See http://dl.acm.org/citation.cfm?id=1094964 or http://stephane.ducasse.free.fr/Teaching/CoursAnnecy/0506-M1-COO/aconcagua-p292-wilkinson.pdf for more about this.

##What I need to use Aconcagua?
Download a fresh image of Pharo (http://www.pharo.org) and in a workspace do-it this:

    Metacello new
	    configuration: 'Aconcagua';
	    githubUser: 'mtaborda' project: 'aconcagua' commitish: 'master' path: 'src';
	    load

Or just install stable version from the configuration browser.
