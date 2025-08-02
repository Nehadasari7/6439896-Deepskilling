import React from 'react';

const WelcomeButton = () => {
  const showWelcome = (msg) => {
    alert(`Message: ${msg}`);
  };

  return (
    <div>
      <button onClick={() => showWelcome('Welcome')}>Say Welcome</button>
    </div>
  );
};

export default WelcomeButton;
