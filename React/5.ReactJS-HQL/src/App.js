import React from 'react';
import CohortDetails from './CohortDetails';

function App() {
  return (
    <div>
      <h1>My Academy Dashboard</h1>
      <CohortDetails name="React Bootcamp" status="ongoing" startDate="2025-06-01" endDate="2025-07-15" />
      <CohortDetails name="Spring Boot Cohort" status="completed" startDate="2025-04-01" endDate="2025-05-15" />
    </div>
  );
}

export default App;
