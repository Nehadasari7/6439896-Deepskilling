import React, { Component } from 'react';
import Post from './Post';

class Posts extends Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      error: null
    };
  }

  loadPosts() {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({ posts: result });
        },
        (error) => {
          this.setState({ error });
        }
      );
  }

  componentDidMount() {
    this.loadPosts();
  }

  componentDidCatch(error, info) {
    alert("An error occurred: " + error);
  }

  render() {
    const { posts, error } = this.state;

    if (error) {
      return <div>Error occurred while loading posts.</div>;
    }

    return (
      <div>
        <h2>Blog Posts</h2>
        {posts.slice(0, 5).map(post => (
          <Post key={post.id} title={post.title} body={post.body} />
        ))}
      </div>
    );
  }
}

export default Posts;
