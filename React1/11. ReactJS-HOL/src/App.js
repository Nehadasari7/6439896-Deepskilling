import React from 'react';
import Counter from './components/Counter';
import WelcomeButton from './components/WelcomeButton';
import SyntheticEventExample from './components/SyntheticEventExample';
import CurrencyConvertor from './components/CurrencyConvertor';

function App() {
  return (
    <div>
      <h1>React Event Examples App</h1>
      <Counter />
      <WelcomeButton />
      <SyntheticEventExample />
      <CurrencyConvertor />
    </div>
  );
}

export default App;
