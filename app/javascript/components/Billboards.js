import React from 'react';

const Billboard = ({ billboard }) => {

  const { id, name, created_at } = billboard
  return (
    <>
      <h3>{name}</h3>
      <p>
        Created: {created_at}, id: {id}
      </p>
      <a href="/">Back</a>
    </>
  )
}

export default Billboard;