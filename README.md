Aconcagua
=======
This model represents measures as first class objects, that is, an object that encapsulates a number with its unit. This representation allows the programmer to use measures in arithmetic expressions as if they were numbers, but with the advantage of providing explicit information to the system, specifically, the measures units.

##What I need to use Aconcagua?
Just download a fresh image of Pharo (http://www.pharo-project.org) and in a workspace do-it this:

    Gofer it
        smalltalkhubUser: 'maxi' project: 'Aconcagua';
        package: 'ConfigurationOfAconcagua';
    load.
    (Smalltalk at: #ConfigurationOfAconcagua) load.
