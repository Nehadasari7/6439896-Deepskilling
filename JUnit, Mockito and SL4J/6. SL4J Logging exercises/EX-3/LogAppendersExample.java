package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAppendersExample {

    private static final Logger logger = LoggerFactory.getLogger(LogAppendersExample.class);

    public static void main(String[] args) {
        logger.info("This is an info message logged to both console and file.");
        logger.warn("This is a warning message.");
        logger.error("This is an error message.");
        logger.debug("This is a debug message.");
    }
}
