import React from 'react';

const OfficeList = () => {
  const officeSpaces = [
    {
      name: "Green Tech Park",
      rent: 45000,
      address: "Sector 21, Gurugram",
      image: "https://via.placeholder.com/150"
    },
    {
      name: "Skyline Tower",
      rent: 65000,
      address: "Hitech City, Hyderabad",
      image: "https://via.placeholder.com/150"
    },
    {
      name: "Bay View Offices",
      rent: 60000,
      address: "Marine Drive, Mumbai",
      image: "https://via.placeholder.com/150"
    }
  ];

  return (
    <div>
      {officeSpaces.map((office, index) => {
        const rentStyle = {
          color: office.rent < 60000 ? 'red' : 'green',
          fontWeight: 'bold'
        };

        return (
          <div key={index} style={{ border: '1px solid #ccc', margin: '10px', padding: '10px' }}>
            <h2>{office.name}</h2>
            <img src={office.image} alt={office.name} width="150" />
            <p><strong>Address:</strong> {office.address}</p>
            <p><strong>Rent:</strong> <span style={rentStyle}>₹{office.rent}</span></p>
          </div>
        );
      })}
    </div>
  );
};

export default OfficeList;
