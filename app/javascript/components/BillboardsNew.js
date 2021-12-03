import React from 'react';

const BillboardNew = ({ billboard }) => {

  // attr that your obj 
  const { name } = billboard 
  // in case there are error it saves the user input
  // one per attr
  const defaultName = name ? name : ""
  return (
    <>
      <h1>Create new Billboard</h1>
      <form action="/billboards" method="post">
        <input
          type="text"
          placeholder="text"
          required
          // these next ones are a must
          defaultValue={defaultName}
          name="billboard[name]"
        />
        <button type="submit">Add Billboard</button>
      </form>
      <a href="/billboards">Back to Billboard</a>
    </>
  )
}

export default BillboardNew;