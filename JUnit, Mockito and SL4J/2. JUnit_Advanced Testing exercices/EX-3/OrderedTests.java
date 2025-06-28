package com.example;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class OrderedTests {

    @Test
    @Order(1)
    void testLogin() {
        System.out.println("Test 1: Login");
        assertTrue(true);
    }

    @Test
    @Order(2)
    void testAddItemToCart() {
        System.out.println("Test 2: Add Item to Cart");
        assertEquals(1, 1);
    }

    @Test
    @Order(3)
    void testCheckout() {
        System.out.println("Test 3: Checkout");
        assertNotNull("Order confirmed");
    }
}
