import React, { useState } from "react";
import { TextField } from '@mui/material';

type Props = {
  favoriteStores: object,
}

const SearchStore: React.FC<Props> = (props) => {

  let favoriteStores = props.favoriteStores;
  let stores = [];

  const [searchText, setSearchText] = useState('');

  const favoriteStoredisplay = (favoriteStores) => {
    stores = favoriteStores;
  }

  return (
    <div>
      <ul>
        {favoriteStores.map((store, index) => (
          <li key={index}>{store}</li>        
        ))}
      </ul>
    </div>
  )

}

export default SearchStore;