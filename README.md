Aconcagua
=======
This model represents measures as first class objects, that is, an object that encapsulates a number with its unit. This representation allows the programmer to use measures in arithmetic expressions as if they were numbers, but with the advantage of providing explicit information to the system, specifically, the measures units. See http://dl.acm.org/citation.cfm?id=1094964 or http://stephane.ducasse.free.fr/Teaching/CoursAnnecy/0506-M1-COO/aconcagua-p292-wilkinson.pdf for more about this.

##What I need to use Aconcagua?
Download a fresh Pharo image (http://www.pharo.org) and in a workspace do-it this:

    #In a 4.x image
    Metacello new
        baseline: 'Aconcagua';
        githubUser: 'mtaborda' project: 'aconcagua' commitish: 'v.4.1.0' path: 'repository';
        load

    #In a 5.x image
    Metacello new
        baseline: 'Aconcagua';
        githubUser: 'mtaborda' project: 'aconcagua' commitish: 'development' path: 'repository';
        load

