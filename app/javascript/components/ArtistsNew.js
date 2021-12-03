import React from 'react';

const ArtistNew = ({ billboard, artist }) => {

  const { id, name } = billboard 
  const { title, body } = artist
  const defaultTitle = title ? title : ""
  const defaultBody = body ? body : ""
  return (
    <>
      <h1>New artist from the billboard {name}</h1>
      <form action={`/billboards/${id}/artists`} method="post">
        <label>Title</label>
        <input 
          type="text"
          required 
          defaultValue={defaultTitle}
          name="artist[title]"
        />
        <label>Body</label>
        <textarea
          required 
          defaultValue={defaultBody}
          name="artist[body]"
        ></textarea>
        <button type="submit">Submit</button>
      </form>
    </>
  )
}

export default ArtistNew;