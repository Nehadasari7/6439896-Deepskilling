package com.example;

import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.mockito.ArgumentMatchers.*;

public class MyAppTest {

    @Test
    public void testSendNotificationWithCorrectArguments() {
        // Step 1: Create a mock object
        NotificationService mockNotificationService = mock(NotificationService.class);

        // Step 2: Use the mock in the app
        MyApp app = new MyApp(mockNotificationService);
        app.process();

        // Step 3: Verify that the method was called with specific arguments
        verify(mockNotificationService).sendNotification(
                eq("user@example.com"),
                eq("Welcome to the app!"));
    }
}
