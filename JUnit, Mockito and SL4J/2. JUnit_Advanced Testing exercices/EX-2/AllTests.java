package com.example;

import org.junit.platform.suite.api.SelectClasses;
import org.junit.platform.suite.api.Suite;

// Marks this class as a test suite
@Suite
@SelectClasses({
        CalculatorTest.class,
        EvenCheckerTest.class
})
public class AllTests {
    // This class remains empty, it is used only as a holder for the above
    // annotations
}
