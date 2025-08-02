import React from 'react';

const FlightList = ({ canBook }) => {
  const flights = [
    { id: 1, from: "Delhi", to: "Mumbai", time: "10:00 AM" },
    { id: 2, from: "Chennai", to: "Bangalore", time: "1:30 PM" },
    { id: 3, from: "Hyderabad", to: "Pune", time: "6:45 PM" }
  ];

  return (
    <div>
      <h3>Available Flights</h3>
      <ul>
        {flights.map(flight => (
          <li key={flight.id}>
            {flight.from} → {flight.to} at {flight.time}
            {canBook && <button style={{ marginLeft: "10px" }}>Book</button>}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default FlightList;
