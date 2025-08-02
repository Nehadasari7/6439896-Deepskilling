import React from 'react';
import FlightList from './FlightList';

const GuestPage = () => {
  return (
    <div>
      <h2>Welcome, Guest</h2>
      <p>You can browse available flights, but booking is disabled.</p>
      <FlightList canBook={false} />
    </div>
  );
};

export default GuestPage;
