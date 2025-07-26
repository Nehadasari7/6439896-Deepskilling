import React from 'react';
import CalculateScore from './Components/CalculateScore';

function App() {
  return (
    <div>
      <h1>Student Score Calculator</h1>
      <CalculateScore name="Alice" school="Greenwood High" total={450} goal={5} />
    </div>
  );
}

export default App;
