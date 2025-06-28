package com.example;

import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class MyServiceTest {

    @Test
    public void testVerifyInteraction() {
        // Create a mock object
        ExternalApi mockApi = mock(ExternalApi.class);

        // Stub the getData method
        when(mockApi.getData()).thenReturn("Mock Data");

        // Call the method with specific arguments (here no arguments but method call)
        MyService service = new MyService(mockApi);
        service.fetchData();

        // Verify that getData was called exactly once
        verify(mockApi, times(1)).getData();
    }
}
