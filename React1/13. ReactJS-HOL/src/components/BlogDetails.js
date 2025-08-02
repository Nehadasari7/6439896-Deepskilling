import React from 'react';

const BlogDetails = () => {
  const blogs = [
    { id: 1, title: "React Best Practices", date: "2025-08-01" },
    { id: 2, title: "How JSX Works", date: "2025-08-02" }
  ];

  return (
    <div>
      <h2>Blog Details</h2>
      <ul>
        {blogs.map(blog => (
          <li key={blog.id}>
            <strong>{blog.title}</strong> - {blog.date}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default BlogDetails;
