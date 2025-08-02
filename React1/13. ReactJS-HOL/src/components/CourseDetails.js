import React from 'react';

const CourseDetails = () => {
  const courses = [
    { id: 1, name: "React for Beginners", duration: "4 weeks" },
    { id: 2, name: "Advanced JS", duration: "6 weeks" }
  ];

  return (
    <div>
      <h2>Course Details</h2>
      <ul>
        {courses.map(course => (
          <li key={course.id}>
            <strong>{course.name}</strong> - {course.duration}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default CourseDetails;
