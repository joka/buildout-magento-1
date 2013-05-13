Development
===========


- Development server: develop.sativa.jokasis.de
- user, paswords, projekt management: https://redmine.jokasis.de/projects/sativa/wiki
- server configuration: https://bitbucket.org/organic_seeds/sativa-server-config-with-puppet


- Testcoverage: http://test_coverage_python.develop.sativa.jokasis.de
- installation passwords/logins: https://bitbucket.org/organic_seeds/magento_buildout



PHP coding style guide
--------------------------------

- Code generation with MTool https://github.com/dankocherga/MTool/wiki/Manual
- Use observers, custom theme interfaces, child blocks whenever possible instead of overrides.
- https://wiki.magento.com/display/MAGE2DOC/PHP+Coding+Standards+and+Practices#PHPCodingStandardsandPractices-3.CodingStyle
- PHPUnit oder functional test browser tests, try 99% code coverage
- always use git


Python coding style guide
--------------------------------

- pep8, pyflakes, pepp-257
- http://docs.pylonsproject.org/en/latest/community/codestyle.html
- 100% test coverage
- run tests with bin/py.test -m"not loadtest"
- always use git


The GIT version control system
------------------------------------------

http://git-scm.com/book
http://ndpsoftware.com/git-cheatsheet.html#loc=index

Commit every atomic modifcation.

update::
    $ git pull --rebase
commit::
    $ git add changed file
    $ git commit -m"my change"
update::
    $ git pull --rebase
push to upstream:
    $ git push

For complex modifcations use features branches and merging
(http://nakedstartup.com/2010/04/simple-daily-git-workflow):


Commit new code
---------------

First look for buildout/code updates::

    $ git pull

Rerun in online/not newest mode::

    $ bin/buildout -N

Go to the repository you want to modify:

    $ cd src/

If you add new files to magento extensions,  rerun modman::

    $ bin/builout -o

If want to add new magento extensions, modify configuration.cfg and rerun buildout::

    $ bin/buildout install modman-extensions

If you modify the python webshop_api restart the server::

    $ bin/supervisorctl restart webshopapi

Mind to add tests

