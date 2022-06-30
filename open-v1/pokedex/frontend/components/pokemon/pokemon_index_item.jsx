import React from 'react';
import { Link } from 'react-router-dom';

class PokemonIndexItem extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        const { id, imageUrl, name } = this.props.pokemon;

        return (
            <li className="pokemon-index-item">
                <Link to={`/pokemon/${ id }`}>
                    <span>{ id }</span>
                    <img src={ imageUrl }/>
                    <span>{ name }</span>
                </Link>
            </li>
        );
    }
}

export default PokemonIndexItem;