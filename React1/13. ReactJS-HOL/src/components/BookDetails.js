import React from 'react';

const BookDetails = () => {
  const books = [
    { id: 1, title: "React in Action", author: "Mark T." },
    { id: 2, title: "Learning JavaScript", author: "Ethan Brown" }
  ];

  return (
    <div>
      <h2>Book Details</h2>
      <ul>
        {books.map(book => (
          <li key={book.id}>
            <strong>{book.title}</strong> by {book.author}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default BookDetails;
