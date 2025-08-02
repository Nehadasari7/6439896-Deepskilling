import React from 'react';

const ListofPlayers = () => {
  const players = [
    { name: "Player1", score: 85 },
    { name: "Player2", score: 55 },
    { name: "Player3", score: 90 },
    { name: "Player4", score: 60 },
    { name: "Player5", score: 75 },
    { name: "Player6", score: 50 },
    { name: "Player7", score: 95 },
    { name: "Player8", score: 30 },
    { name: "Player9", score: 100 },
    { name: "Player10", score: 40 },
    { name: "Player11", score: 80 }
  ];

  const filtered = players.filter(p => p.score < 70);

  return (
    <div>
      <h2>All Players</h2>
      <ul>
        {players.map((p, index) => (
          <li key={index}>{p.name}: {p.score}</li>
        ))}
      </ul>
      <h2>Players with score below 70</h2>
      <ul>
        {filtered.map((p, index) => (
          <li key={index}>{p.name}: {p.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListofPlayers;
