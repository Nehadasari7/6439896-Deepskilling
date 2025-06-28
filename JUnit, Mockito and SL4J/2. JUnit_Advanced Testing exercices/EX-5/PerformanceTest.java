package com.example;

public class PerformanceTester {

    public void performTask() {
        try {
            // Simulate a task that takes some time
            Thread.sleep(500); // 500 milliseconds
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
