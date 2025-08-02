import React from 'react';

const SyntheticEventExample = () => {
  const handleClick = (event) => {
    alert("I was clicked");
    console.log(event); // This is a synthetic event
  };

  return (
    <div>
      <button onClick={handleClick}>Synthetic Event Button</button>
    </div>
  );
};

export default SyntheticEventExample;
