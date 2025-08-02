import React, { useState } from 'react';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';

function App() {
  const [showBook, setShowBook] = useState(true);
  const [showBlog, setShowBlog] = useState(false);
  const [showCourse, setShowCourse] = useState(true);

  let bookComponent;
  if (showBook) {
    bookComponent = <BookDetails />;
  }

  return (
    <div>
      <h1>Blogger App</h1>

      {/* if-else using element variable */}
      {bookComponent}

      {/* ternary operator */}
      {showBlog ? <BlogDetails /> : <p>Blog Details are hidden</p>}

      {/* short-circuit rendering */}
      {showCourse && <CourseDetails />}
    </div>
  );
}

export default App;
