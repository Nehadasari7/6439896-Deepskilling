import React from 'react';

const IndianPlayers = () => {
  const oddPlayers = ["Player1", "Player3", "Player5", "Player7", "Player9", "Player11"];
  const evenPlayers = ["Player2", "Player4", "Player6", "Player8", "Player10"];

  const T20players = ["Rohit", "Virat", "Hardik"];
  const RanjiTrophy = ["Rahane", "Pujara"];
  const mergedPlayers = [...T20players, ...RanjiTrophy];

  return (
    <div>
      <h2>Odd Team Players</h2>
      <ul>
        {oddPlayers.map((p, i) => <li key={i}>{p}</li>)}
      </ul>
      <h2>Even Team Players</h2>
      <ul>
        {evenPlayers.map((p, i) => <li key={i}>{p}</li>)}
      </ul>
      <h2>Merged T20 & Ranji Trophy Players</h2>
      <ul>
        {mergedPlayers.map((p, i) => <li key={i}>{p}</li>)}
      </ul>
    </div>
  );
};

export default IndianPlayers;
