import React from 'react';

const ArtistEdit = ({ billboard, artist }) => {

  const { id, name } = billboard 
  const { title, body } = artist
  const defaultTitle = title ? title : ""
  const defaultBody = body ? body : ""
  return (
    <>
      <h1>New Artist on Billboard {name}</h1>
      <form action={`/billboards/${id}/artists/${artist.id}`} method="post">
        <input type="hidden" name="_method" value="patch" />
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

export default ArtistEdit;