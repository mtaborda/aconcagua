Aconcagua
=======
[![Build Status](https://travis-ci.org/ba-st/Aconcagua.svg?branch=development)](https://travis-ci.org/ba-st/Aconcagua)
[![Coverage Status](https://coveralls.io/repos/github/ba-st/Aconcagua/badge.svg?branch=development)](https://coveralls.io/github/ba-st/Aconcagua?branch=development)

This model represents measures as first class objects, that is, an object that encapsulates a number with its unit. This representation allows the programmer to use measures in arithmetic expressions as if they were numbers, but with the advantage of providing explicit information to the system, specifically, the measures units. See http://dl.acm.org/citation.cfm?id=1094964 or http://stephane.ducasse.free.fr/Teaching/CoursAnnecy/0506-M1-COO/aconcagua-p292-wilkinson.pdf for more about this.

### What I need to use Aconcagua?
Download a fresh Pharo image (http://www.pharo.org) and in a playground do-it this:

#### In a 6.x image
      Metacello new
        baseline: 'Aconcagua';
        githubUser: 'ba-st' project: 'aconcagua' commitish: 'v6.0.0' path: 'repository';
        load

#### For 6.x previous images
go-to => https://github.com/mtaborda/aconcagua
