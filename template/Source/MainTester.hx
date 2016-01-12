import unittest.implementations.TestHTTPLogger;
import unittest.implementations.TestJUnitLogger;
import unittest.implementations.TestSimpleLogger;

import unittest.TestRunner;

import SimpleTest;
import AsyncTest;

import duellkit.DuellKit;

class MainTester
{
    static function main()
    {
        DuellKit.initialize(start);
    }

    static function start() : Void
    {
        var r = new TestRunner(testComplete, DuellKit.instance().onError);
        r.add(new SimpleTest());
        r.add(new AsyncTest());

        #if jenkins
            r.addLogger(new TestHTTPLogger(new TestJUnitLogger()));
        #else
            r.addLogger(new TestHTTPLogger(new TestSimpleLogger()));
        #end

        //To run unittests on devices with android version < 5.0 don't use an HTTPLogger
        //r.addLogger(new TestSimpleLogger());

        r.run();
    }

    static function testComplete()
    {

    }

}
