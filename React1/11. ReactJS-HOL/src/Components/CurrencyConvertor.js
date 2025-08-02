import React, { useState } from 'react';

const CurrencyConvertor = () => {
  const [inr, setInr] = useState('');
  const [eur, setEur] = useState('');

  const handleINRtoEUR = (e) => {
    e.preventDefault();
    setEur((parseFloat(inr) / 90).toFixed(2));
  };

  const handleEURtoINR = (e) => {
    e.preventDefault();
    setInr((parseFloat(eur) * 90).toFixed(2));
  };

  return (
    <div>
      <h3>Currency Convertor</h3>
      <form>
        <label>INR: </label>
        <input
          type="number"
          value={inr}
          onChange={(e) => setInr(e.target.value)}
        />
        <button onClick={handleINRtoEUR}>Convert to Euro</button>
        <br /><br />
        <label>EUR: </label>
        <input
          type="number"
          value={eur}
          onChange={(e) => setEur(e.target.value)}
        />
        <button onClick={handleEURtoINR}>Convert to INR</button>
      </form>
    </div>
  );
};

export default CurrencyConvertor;
