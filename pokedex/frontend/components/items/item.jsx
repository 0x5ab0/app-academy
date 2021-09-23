import React from 'react';

const Item = ({ item }) => {
    return (
        <li>
            <img src={ item.imageUrl } alt={ item.name } />
        </li>
    );
}

export default Item;