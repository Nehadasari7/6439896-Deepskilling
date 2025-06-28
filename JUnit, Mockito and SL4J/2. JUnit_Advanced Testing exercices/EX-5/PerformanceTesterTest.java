package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

import java.time.Duration;

public class PerformanceTesterTest {

    @Test
    void testPerformTaskCompletesWithinTime() {
        PerformanceTester tester = new PerformanceTester();

        assertTimeout(Duration.ofMillis(1000), () -> {
            tester.performTask();
        }, "Task should complete within 1000 milliseconds");
    }

    @Test
    void testPerformTaskFailsIfTakesTooLong() {
        PerformanceTester tester = new PerformanceTester();

        assertTimeoutPreemptively(Duration.ofMillis(300), () -> {
            tester.performTask();
        }, "Task should fail if it takes longer than 300 milliseconds");
    }
}
