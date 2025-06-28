package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ParameterizedLoggingExample {

    private static final Logger logger = LoggerFactory.getLogger(ParameterizedLoggingExample.class);

    public static void main(String[] args) {
        String userName = "Neha";
        int userId = 12345;
        double balance = 7890.50;

        // Parameterized logs
        logger.info("User {} with ID {} has a balance of {}", userName, userId, balance);
        logger.warn("Balance for user {} (ID: {}) is low: {}", userName, userId, balance);
        logger.error("Error occurred while processing account for user {}", userName);

        // Debug level with parameters
        logger.debug("Debugging user {} details with ID {}", userName, userId);
    }
}
