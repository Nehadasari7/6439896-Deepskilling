package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class MathOperationsTest {

    MathOperations math = new MathOperations();

    @Test
    public void testSquare() {
        assertEquals(25, math.square(5));
        assertEquals(0, math.square(0));
    }

    @Test
    public void testCube() {
        assertEquals(27, math.cube(3));
        assertEquals(0, math.cube(0));
    }

    @Test
    public void testIsEven() {
        assertTrue(math.isEven(4));
        assertFalse(math.isEven(5));
    }

    @Test
    public void testIsOdd() {
        assertTrue(math.isOdd(5));
        assertFalse(math.isOdd(4));
    }
}
