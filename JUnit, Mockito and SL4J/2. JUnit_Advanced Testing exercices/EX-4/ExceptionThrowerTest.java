package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class ExceptionThrowerTest {

    @Test
    void testThrowsException() {
        ExceptionThrower thrower = new ExceptionThrower();

        // Check if IllegalArgumentException is thrown when input is null
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            thrower.throwException(null);
        });

        // Validate the exception message
        assertEquals("Input cannot be null", exception.getMessage());
    }

    @Test
    void testDoesNotThrowException() {
        ExceptionThrower thrower = new ExceptionThrower();

        // This should not throw an exception
        assertDoesNotThrow(() -> thrower.throwException("Hello"));
    }
}
